class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :check_admin, except: %i[index show]

  def self.highlight
    where(highlight: true)
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: "Post was created successfully"
    else
      # redirect_to new_post_path, alert: "There was an error with your submission."
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully destroyed."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :published, :highlight, :user_id)
  end

  def check_admin
    redirect_to root_path, alert: "You are not authorized to perform this action." unless current_user && current_user.admin?
  end
end
