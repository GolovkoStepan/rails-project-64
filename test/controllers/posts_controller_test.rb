# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @post = posts(:without_comments)
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    post posts_url, params: {
      post: {
        body: @post.body,
        title: @post.title,
        category_id: categories(:one).id
      }
    }

    assert_response :redirect

    record = Post.find_by(
      body: @post.body,
      title: @post.title,
      category_id: categories(:one).id,
      creator_id: users(:one).id
    )

    assert { record.present? }
  end

  test 'should not create post when params is not valid' do
    post posts_url, params: {
      post: {
        body: 'not enough chars',
        title: '',
        category_id: ''
      }
    }

    assert_response :unprocessable_content
    assert_select 'form'

    record = Post.find_by(
      body: 'not enough'
    )

    assert { record.nil? }
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    assert_equal(@post.category, categories(:two))

    patch post_url(@post), params: {
      post: {
        body: @post.body,
        title: @post.title,
        category_id: categories(:one).id
      }
    }

    assert_redirected_to post_url(@post)

    @post.reload

    assert { @post.category == categories(:one) }
  end

  test 'should destroy post' do
    delete post_url(@post)

    assert_redirected_to posts_url

    record = Post.find_by(
      body: @post.body,
      title: @post.title,
      category_id: @post.category_id,
      creator_id: @post.creator_id
    )

    assert { record.nil? }
  end
end
