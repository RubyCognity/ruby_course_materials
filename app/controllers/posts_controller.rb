class PostsController < ApplicationController 
    protect_from_forgery with: :null_session, if: Proc.new { request.format.json? }

    def index 
        @posts = Post.all
        respond_to do |format|
            format.html 
            format.json { render json: @posts, status: :ok }
        end
    end 

    def show
        @post = Post.find(params[:id])
        respond_to do |format| 
            format.html 
            format.json { render json: @post, status: :ok }
        end
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        respond_to do |format|
            format.html do
                 if @post.save
                    redirect_to posts_path 
                 else
                    render :new
                 end
            end
            format.json do 
                render @post.save ? { json: @post, status: :created } : { json: @post.errors.messages, status: :bad_request }
            end
        end
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def update 
        @post = Post.find(params[:id])
        respond_to do |format|
            format.html do
                if @post.update(post_params)
                   redirect_to posts_path 
                else
                   render :edit
                end
           end
           format.json do 
               render @post.update(post_params) ? { json: @post, status: :ok } : { json: @post.errors.messages, status: :bad_request }
           end
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        respond_to do |format| 
            format.html { redirect_to posts_path }
            format.json { head :ok }
        end
    end

    private

    def post_params 
        params.require(:post).permit(:content)
    end
end
