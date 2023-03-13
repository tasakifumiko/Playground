class User::ReviewsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(post_id: @post.id)
    @comment.save
  end
end