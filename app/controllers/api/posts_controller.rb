class ::Api::PostsController < ActionController::API
    def index 
        @posts = Post.all
        render json: @posts, status: :ok
    end 

    def show
        @post = Post.find(params[:id])
        render json: @post, status: :ok
    end

    def create
        @post = Post.new(post_params)
        result = if @post.save
                    { json: @post, status: :created }
                 else
                    { json: @post.errors.messages, status: :bad_request }
                 end
        render result 
    end

    def update 
        @post = Post.find(params[:id])
        result = if @post.update(post_params)
                    { json: @post, status: :ok }
                 else
                   { json: @post.errors.messages, status: :bad_request }
                 end

        render result
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        # head :ok
        render json: Post.all, status: :ok
    end

    private

    def post_params 
        params.require(:post).permit(:content, :title)
    end
end
