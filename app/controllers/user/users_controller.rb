class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(current_user.id)
    @posts = @user.posts
  end

  def index
    @bookmarks = current_user.bookmarks.includes(:post)
  end

  # def bookmarks
  #   @user = User.find(params[:id])
  #   @bookmark_posts = @user.bookmark_ids.map { |id| Post.find(id) }
  # end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] =  "You habe updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

    private

  def user_params
    params.require(:user).permit(:full_name, :user_name, :profile_image)
  end
end
