require "rails_helper"

RSpec.describe "AuthorsController#update", type:  :request do

  before(:each) do 
    post api_authors_path, params: author_params
  end


  context "with invalid params" do 
    let(:author_params) do 
        {
            author: {
                first_name: 'John',
                last_name: 'Doe', 
                phone_number: '555-321-312'
            }
        }
    end

    it "should create post with proper first_name" do
        expect(json_response['first_name']).to eq(author_params.dig(:author, :first_name))
    end

    it "should create post with proper last_name" do 
        expect(json_response['last_name']).to eq(author_params.dig(:author, :last_name))
    end

    it "should create post with proper phone_number" do 
        expect(json_response['phone_number']).to eq(author_params.dig(:author, :phone_number))
    end

    it "should return proper HTTP status" do 
        expect(response).to have_http_status(:created) # 201
    end
  end


  context "with invalid params" do 
    let(:author_params) do 
        {
            author: {
                first_name: '',
                last_name: '', 
                phone_number: ''
            }
        }
    end

    it "should return proper error messages" do
        expect(json_response.to_json).to eq({"first_name"=>["can't be blank"], "last_name"=>["can't be blank"], "phone_number" => ["Phone number should be in xxx-xxx-xxx format"]}.to_json)
    end

    # subject also can be used
    it "should not create author" do 
        expect(Author.count).to eq(0)
    end

    it "should return proper HTTP status" do 
        expect(response).to have_http_status(:bad_request) # 400
    end
  end
end