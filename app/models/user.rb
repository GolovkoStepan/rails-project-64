# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :posts,
           dependent: :restrict_with_error,
           inverse_of: 'creator'

  has_many :comments,
           class_name: 'PostComment',
           dependent: :destroy

  has_many :likes,
           class_name: 'PostLike',
           dependent: :destroy

  def owns?(resource)
    return false unless resource.persisted?
    return true if resource.try(:user_id) == id
    return true if resource.try(:creator_id) == id

    false
  end

  def liked?(post)
    likes.exists?(post_id: post.id)
  end
end
