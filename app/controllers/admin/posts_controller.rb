class Admin::PostsController < ApplicationController
   before_action :authenticate_admin!
  def index
     @posts = Post.all
     @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @review= Review.new
  end
  
  # def update
  #   byebug
  #   review = Review.find(params[:id])
  #   review.update(review_params)
  #   redirect_to admin_post_path(review.post.id)
  # end
  
  # def review_params
  #   params.require(:review).permit(:visible)
  # end

end
