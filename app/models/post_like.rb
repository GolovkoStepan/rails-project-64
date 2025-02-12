# frozen_string_literal: true

class PostLike < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  validates :user_id,
            uniqueness: { scope: :post_id, message: I18n.t('activerecord.errors.models.post_like.already_liked') }
end
