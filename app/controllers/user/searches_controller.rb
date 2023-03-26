class User::SearchesController < ApplicationController

  def search
    @posts = Post.all
    @genres = Genre.all
    @post = params[:name].present? ? Genre.find(params[:name]).posts : Post.all
    @areas = Area.all
  end

  def filter
    @genres = Genre.all
    @areas = Area.all

    if params[:keyword].present?
      @posts = Post.where("text like ?", "%" + params[:keyword] + "%")
    else
      @posts = Post.all
    end
    render :search
  end
end