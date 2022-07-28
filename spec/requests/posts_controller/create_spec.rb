require "rails_helper"

RSpec.describe "PostsController#update", type:  :request do

  before(:each) do 
    post api_posts_path, params: post_params
  end


  context "with invalid params" do 
    let(:post_params) do 
        {
            post: {
                content: 'Post content',
                title: 'Post title'
            }
        }
    end

    it "should create post with proper content" do
        expect(json_response['content']).to eq(post_params.dig(:post, :content))
    end

    it "should create post with proper title" do 
        expect(json_response['title']).to eq(post_params.dig(:post, :title))
    end

    it "should return proper HTTP status" do 
        expect(response).to have_http_status(:created) # 201
    end
  end


  context "with invalid params" do 
    let(:post_params) do 
        {
            post: {
                content: '',
                title: ''
            }
        }
    end

    it "should return proper error messages" do
        expect(json_response.to_json).to eq({"content"=>["can't be blank"], "title"=>["can't be blank"]}.to_json)
    end

    # subject also can be used
    it "should not create post" do 
        expect(Post.count).to eq(0)
    end

    it "should return proper HTTP status" do 
        expect(response).to have_http_status(:bad_request) # 400
    end
  end
end