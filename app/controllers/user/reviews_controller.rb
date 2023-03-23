class User::ReviewsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_user.reviews.new(review_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end
  
  def index
    @comments = Comment.all
  end

  private

  def review_params
    params.require(:review).permit(:comment, :score)
  end

end
