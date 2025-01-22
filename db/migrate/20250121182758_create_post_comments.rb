# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[7.2]
  def change
    create_table :post_comments do |t|
      t.string :content, null: false
      t.belongs_to :post, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :ancestry

      t.timestamps
    end

    add_index :post_comments, :ancestry
  end
end
