class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # NEEDS refactoring
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash.notice = "User successfully created. You are logged in as #{@user.username}"
      redirect_to dashboard_path
    else
      flash.notice = "User could not be created"
      redirect_to action: :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
