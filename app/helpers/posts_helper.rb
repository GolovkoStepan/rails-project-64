# frozen_string_literal: true

module PostsHelper
  def like_component(post)
    user_signed_in? ? active_icon(post) : inactive_icon
  end

  private

  def active_icon(post)
    current_like = post.likes.find { |like| like.user == current_user }

    if current_like
      link_to(post_like_path(post, current_like), data: { turbo_method: :delete }, class: 'text-dark') do
        content_tag(:i, '', class: 'i bi bi-hand-thumbs-up-fill')
      end
    else
      link_to(post_likes_path(post), data: { turbo_method: :post }, class: 'text-dark') do
        content_tag(:i, '', class: 'i bi bi-hand-thumbs-up')
      end
    end
  end

  def inactive_icon
    content_tag(:i, '', class: 'i bi bi-hand-thumbs-up text-dark')
  end
end
