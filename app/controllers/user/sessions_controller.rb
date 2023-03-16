# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
 
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def after_sign_in_path_for(resource)
    posts_path
   
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
  end

#退会しているかを判断するメソッド
  def user_state
    ##入力されたemailからアカウントを1件取得
   @user = User.find_by(email: params[:user][:email])
   
    ##アカウントを取得できなかった場合、このメソッドを終了する
   return if !@user
   
   ##取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別

   if @user.valid_password?(params[:user][:password]) && @user.is_deleted
     flash[:notice] = "退会済みです。再度ご登録をお願い致します。"
     
     redirect_to new_user_session_path
   else
     
     user_session_path
   end
  end
end
