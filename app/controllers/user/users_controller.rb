class User::UsersController < ApplicationController
  
  def show
    @user = User.find(current_user.id)
    @posts = @user.posts
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
end
