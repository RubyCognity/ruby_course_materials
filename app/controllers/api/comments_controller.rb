class ::Api::CommentsController < ApplicationController 
    before_action :set_post
    before_action :set_comment, only: :show

    def index 
        post_comments = @post.comments 
        render json: post_comments, status: :ok
    end

    def show 
        render json: @comment, status: :ok
    end

    private 

    def set_post 
        @post = Post.find(params[:post_id])
    end

    def set_comment
        @comment = @post.comments.find(params[:id])
    end
end