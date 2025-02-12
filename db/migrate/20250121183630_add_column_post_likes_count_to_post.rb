# frozen_string_literal: true

class AddColumnPostLikesCountToPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :post_likes_count, :integer, null: false, default: 0
  end
end
