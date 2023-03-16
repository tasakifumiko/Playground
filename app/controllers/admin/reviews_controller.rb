class Admin::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.all
  end
  
  def show
    @reviews = Review.find(params[:id])
  end

  def toggle_visibility
    @review = Review.find(params[:id])
    @review.update(visible: !@review.visible)
    redirect_to admin_review_path(@review)
  end
  
  def toggle_visibility
    @review = Review.find(params[:id])
    @review.update(visible: !@review.visible)
    respond_to do |format|
      format.js
    end
  end
end
