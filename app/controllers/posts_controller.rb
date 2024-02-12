class PostsController < ApplicationController
  before_action :require_login

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def require_login
    unless current_user
      redirect_to login_path
    end
  end

end
