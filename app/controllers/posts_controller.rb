class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:author_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author: current_user, title: params[:title], text: params[:text])
    @post.author = current_user
    if @post.save
      redirect_to user_posts_path(id: @post.author_id)
    else
      render :new, alert: 'Error: Post not saved.'
    end
  end

  def show
    @user = User.find(params[:author_id])
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(request.parameters[:id])
    @post.destroy
    redirect_to user_posts_path(params[:author_id])
  end
end
