class User::HomesController < ApplicationController

  def top
  end

  def about
    @posts = Post.all.order(created_at: :desc) 
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: 'guestuserでログインしました。'
  end


end