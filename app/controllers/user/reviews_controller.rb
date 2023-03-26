class User::ReviewsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @review= Review.new
    @reviews = @post.reviews.where(visible: true)
    comment = current_user.reviews.new(review_params)
    comment.post_id = @post.id
    comment.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @review= Review.new
    @reviews = @post.reviews.where(visible: true)
    Review.find_by(id: params[:id], post_id: params[:post_id]).destroy
  end

  def index
    @comments = Comment.all
  end

  private

  def review_params
    params.require(:review).permit(:comment, :score)
  end

end
