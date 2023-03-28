class User::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "投稿が成功しました"
      redirect_to post_path(@post)
    else
      @posts = Post.all
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @review= Review.new
    @reviews = @post.reviews.where(visible: true)
  end

  def index
    @posts = Post.all.order(created_at: :desc) 
    @post = Post.new
    @post_genre = @posts.where(genre: params[:genre])
    @genre_name = params[:genre_name]
    
  end


  def edit
  end

  def update
    @post= Post.find(params[:id])
    if @post.update(post_params)
       flash[:notice] = "更新しました！"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post =Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to user_path(current_user)
  end
  

  private

  def post_params
    params.require(:post).permit(:playground, :title, :text, :genre_id, :area_id, images: [] )
  end

  def ensure_correct_user
    @post= Post.find(params[:id])
    unless @post.user == current_user
      redirect_to post_path(@post.id)
    end
  end
end