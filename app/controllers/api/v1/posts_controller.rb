module Api
  module V1
    class UsersController < ApplicationController
      def index 
        @user = User.find(params[:author_id])
        @posts = Post.find_by(author: @user)
        render json: @posts, status: 200
      end

      def create 
        @post = Post.new(author: current_user, title: params[:title], text: params[:text])
        if @post.save
          render json: {response: 'post created successfully'}, status: 200
        else
          render error: { error: 'Post not created'}, status: 400
        end
      end
    end
  end
end
