class Admin::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.all
  end
  
  def show
    @reviews = Review.find(params[:id])
    @comments = @review.comments.all
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to admin_post_path(review.post.id)
  end
  
  def review_params
    params.require(:review).permit(:visible)
  end
end
