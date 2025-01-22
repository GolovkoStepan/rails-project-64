# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should create like' do
    sign_in users(:two)

    record = Post.last

    post post_likes_url(record)

    assert_redirected_to post_url(record)
    assert { users(:two).liked?(record) }
  end

  test 'should destroy like' do
    sign_in users(:one)

    record = Post.last

    assert { users(:one).liked?(record) }

    delete post_like_url(record, record.likes.find_by(user: users(:one)))

    assert_redirected_to post_url(record)
    assert { !users(:one).liked?(record) }
  end
end
