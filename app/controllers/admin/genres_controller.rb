class Admin::GenresController < ApplicationController
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end
  
  def new
    @genre = Genre.new
  end
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "更新しました"
      redirect_to admin_genres_path
    else
      render :edit
    end
  end
  
  def destroy
    @genre =Genre.find(params[:id])
    @genre.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_genres_path
  end
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
