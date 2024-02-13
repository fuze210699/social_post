class DashboardController < ApplicationController
  before_action :has_user
  def index
  end

  def has_user
    Rails.logger.info("Session: #{session[:user_id]}")
    unless session[:user_id]
      redirect_to login_path
    end
  end
end
