require "rails_helper"

RSpec.describe "PostsController#update", type:  :request do
  let(:post) { create(:post) }

  before(:each) do 
    patch api_post_path(post), params: post_params
  end


  context "with invalid params" do 
    let(:post_params) do 
        {
            post: {
                content: 'Updated content'
            }
        }
    end

    it "should update post" do
        expect(json_response['content']).to eq(post_params.dig(:post, :content))
    end

    it "should return proper HTTP status" do 
        expect(response).to have_http_status(:ok) # 200
    end
  end


  context "with invalid params" do 
    let(:post_params) do 
        {
            post: {
                content: ''
            }
        }
    end

    it "should not update post" do 
        expect(json_response['content']).not_to eq(post_params.dig(:post, :content))
    end

    it "should return proper HTTP status" do 
        expect(response).to have_http_status(:bad_request) # 400
    end
  end
end