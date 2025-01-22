# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    comment = Post.find(params[:post_id]).comments.build(comment_params)

    if comment.save
      redirect_to post_path(comment.post), notice: t('comments.created')
    else
      redirect_to post_path(comment.post), alert: comment.errors.full_messages.join('. ')
    end
  end

  def destroy
    comment = PostComment.find(params[:id])
    comment.destroy if current_user.owns?(comment)

    redirect_to post_path(comment.post), notice: t('comments.destroyed')
  end

  private

  def comment_params
    params
      .require(:post_comment)
      .permit(:content, :parent_id)
      .merge(user: current_user)
  end
end
