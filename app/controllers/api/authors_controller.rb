class ::Api::AuthorsController < ActionController::API
    def index 
        @authors = Author.all
        render json: @authors, status: :ok
    end 

    def show
        @author = Author.find(params[:id])
        render json: @author, status: :ok
    end

    def create
        @author = Author.new(author_params)
        result = if @author.save
                    { json: @author, status: :created }
                 else
                    { json: @author.errors.messages, status: :bad_request }
                 end
        render result 
    end

    private

    def author_params 
        params.require(:author).permit(:first_name, :last_name, :phone_number)
    end
end
