class User::HomesController < ApplicationController
  
  def top
  end
  
  def about
    @posts = Post.all
  end
end
