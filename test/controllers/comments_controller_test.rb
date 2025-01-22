# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup { sign_in users(:one) }

  test 'should create comment' do
    record = Post.last

    post post_comments_path(record),
         params: { post_comment: { content: 'MyString' } }

    assert_redirected_to post_url(record)

    comment = PostComment.find_by(
      content: 'MyString',
      post: record,
      user: users(:one)
    )

    assert { comment.present? }
  end

  test 'should not create empty comment' do
    comment_count = PostComment.count

    post post_comments_path(post_id: Post.last.id),
         params: { post_comment: { content: '' } }

    assert_redirected_to post_url(Post.last)

    assert { PostComment.count == comment_count }
  end

  test 'should destroy comment' do
    comment = PostComment.last

    delete comment_path(comment)

    assert_redirected_to post_path(comment.post)

    record = PostComment.find_by(
      content: comment.content,
      post: comment.post,
      user: comment.user
    )

    assert { record.nil? }
  end
end
