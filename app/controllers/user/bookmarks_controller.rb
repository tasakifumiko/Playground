class User::BookmarksController < ApplicationController

  def create
    @bookmark = current_user.bookmarks.new(post_id: params[:post_id])
    @bookmark.save
    @post = Post.find(params[:post_id])
  end

  def destroy
    @post= Post.find(params[:post_id])
    @bookmark = current_user.bookmarks.find_by(post_id: @post.id)
    @bookmark.destroy
  end

  def index
    @bookmarks = current_user.bookmarks.includes(:post)
  end

end
