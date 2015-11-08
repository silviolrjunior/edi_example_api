class Api::PostsController < ApplicationController

  def index
    posts = []
    Post.all.each do |post|
      posts.push(post)
    end
    render json: { post: posts }
  end

  def show
    post = Post.find(params[:id])
    render json: { post: post }
  end

  def create
    post = Post.create(post_params)
    render json: {post: post}, status: 201
  end

  def post_params
    params.require(:post).permit(:title, :message)
  end
end
