# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category

  belongs_to :creator,
             class_name: 'User',
             inverse_of: 'posts'

  has_many :comments,
           class_name: 'PostComment',
           dependent: :destroy

  has_many :likes,
           class_name: 'PostLike',
           dependent: :destroy

  validates :title, length: { in: 5..255 }
  validates :body, length: { in: 200..4000 }

  def like!(user)
    likes.create!(user: user)
  end
end
