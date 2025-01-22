# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.like!(current_user) unless current_user.liked?(post)

    redirect_to post_path(post)
  end

  def destroy
    like = PostLike.find(params[:id])
    like.destroy if current_user.owns?(like)

    redirect_to post_path(like.post)
  end
end
