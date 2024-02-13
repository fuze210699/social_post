class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :has_user, except: :destroy

  def create
    login_service = LoginService.new(params[:session][:email], params[:session][:password])
    user = login_service.call

    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
    end
    Rails.logger.info("Session: #{session[:user_id]}")
  end

  def destroy
    Rails.logger.info("Session: #{session[:user_id]}")
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully'
  end

  private

  def has_user
    if session[:user_id] && action_name != 'destroy'
      redirect_to root_path
    end
  end
end
