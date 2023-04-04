class Admin::ReviewsController < ApplicationController
  
  def index
    @review = Review.find(params[:post_id])
    @reviews = Review.all
    comment_score.review_id = @review.id
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
