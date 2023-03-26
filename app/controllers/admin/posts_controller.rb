class Admin::PostsController < ApplicationController
   before_action :authenticate_admin!
  def index
     @posts = Post.all.order(created_at: :desc) 
     @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @review= Review.new
  end
  
end
