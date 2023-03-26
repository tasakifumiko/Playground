class User::HomesController < ApplicationController

  def top
  end

  def about
    @posts = Post.all.order(created_at: :desc) 
  end

  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end

    sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました！'
  end

end