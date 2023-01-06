module Api
  module V1
    class CommentsController < ApplicationController
        def index
            @user = User.find(params[:author_id])
            render json: comments, status: :ok
        end

        def create
            @post = @user.posts.find(params[:id])
            @comment = @post.comments.create(text: comment_params[:text], author_id: current_user.id, post_id: @post.id)
            if @comment.save
                render json: @comment
              else
                render error: { error: 'Unable to create comments' }, status: 400
            end
        end

        def comment_params
            params.permit(:text)
        end 
    end
  end
end
