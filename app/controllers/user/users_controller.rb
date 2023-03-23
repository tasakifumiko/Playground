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
  
  def ensure_correct_user
    @user= User.find(params[:id])
    unless @user == current_user
      redirect_to posts_path
    end
  end
end
