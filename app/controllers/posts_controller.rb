# frozen_string_literal: true

class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[new edit create update]

  def index
    @posts = Post.includes(:creator, :category).order(created_at: :desc)
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: t('posts.actions.created')
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: t('posts.actions.updated')
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: t('posts.actions.deleted')
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
