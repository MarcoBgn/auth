class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    validated = SessionValidator.validate(user)
    process_validated(validated).inspect
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to root_path
  end

  private
  def process_validated(validated)
    session[:user_id] = validated[:user_id] || nil
    flash[:notice] = validated[:notice] || nil
    validated[:valid] ? validated[:valid].call(redirect_to, dashboard_path)
                      : validated[:invalid].call(redirect_to, new_session_path)
  end
end
