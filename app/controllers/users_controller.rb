class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      flash.notice = "User successfully created"
      redirect_to :dashboard_path
    else
      flash.now.notice = "User could not be created"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
