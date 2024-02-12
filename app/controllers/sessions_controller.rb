class SessionsController < ApplicationController
  before_action :has_user
  def new
  end

  def create
    login_service = LoginService.new(params[:session][:email], params[:session][:password])
    user = login_service.call

    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully'
  end

  private

  def has_user
    if session[:user_id]
      redirect_to root_path
    end
  end
end
