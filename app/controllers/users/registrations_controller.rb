# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
    # @user = User.new
  end

  # POST /resource
  def create
    super
    # ↓自作
    # @user = User.new(user_signup_params)
    # if @user.save
    #   flash[:success] = "ユーザー登録に成功しました。"
    #   redirect_to @user
    # else
    #   render :new
    # end
  end

  # DELETE /resource
  def destroy
  end

  protected
  # 登録後の遷移先を指定
  def after_sign_up_path_for(resource)
    user_path(@user)
  end
  
  private
    # ↓自作
    # def user_signup_params
    #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
    # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end