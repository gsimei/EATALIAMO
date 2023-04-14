class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = Post.where(published: true).order(created_at: :desc)
    @highlighted_posts = Post.highlighted
  end
end
