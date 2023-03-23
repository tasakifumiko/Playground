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
      redirect_to post_path(@post)
    else
      @posts = Post.all
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
    @review= Review.new
    @reviews = @post.reviews.where(visible: true)
  end

  def index
    @posts = Post.all
    @post = Post.new
    @post_genre = @posts.where(genre: params[:genre])
    @genre_name = params[:genre_name]
    
  end


  def edit
  end

  def update
    @post= Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @post =Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user), notice: "投稿を削除しました"
  end
  

  # # コメントが表示指定されているかを判断するメソッド
  # def comment_state
  #   ## 【処理内容1】 入力されたemailからアカウントを1件取得
  #   @comment = Review.find_by(email: params[:customer][:email])
  #   ## アカウントを取得できなかった場合、このメソッドを終了する
  #   return if !visible == 
  #   ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  #   if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
  #     ## 【処理内容3】
  #     flash[:withdrawal] = "退会済みです。再度ご登録をしてご利用ください。"
  #       redirect_to new_customer_registration_path
  #   end
  # end




  private

  def post_params
    params.require(:post).permit(:playground, :title, :text, :genre_id, :area_id, images: [] )
  end

  def ensure_correct_user
    @post= Post.find(params[:id])
    unless @post.user == current_user
      redirect_to books_path
    end
  end
end