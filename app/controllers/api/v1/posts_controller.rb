class Api::V1::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    posts = Post.all
    render json: posts
  end

  def create
    @post = current_user.posts.build(post_params)
  
    if @post.save
      redirect_to root_path
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
