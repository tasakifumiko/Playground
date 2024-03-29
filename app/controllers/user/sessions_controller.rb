# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
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


  def user_state
   @user = User.find_by(email: params[:user][:email])
   return if !@user
   if @user.valid_password?(params[:user][:password]) && @user.is_deleted
     flash[:notice] = "退会済みです。再度ご登録をお願い致します。"
     redirect_to new_user_session_path
   else
     user_session_path
   end
  end
end
