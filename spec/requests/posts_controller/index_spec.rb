require "rails_helper"

RSpec.describe "PostsController#index", type:  :request do
  let(:posts) { create_list(:post, 3) }

  before(:each) do
    posts # or let! 
    get api_posts_path
  end

  it "should return proper JSON response" do 
    posts_json = posts.map { |el| el.as_json.except(:created_at, :updated_at) }
    json_response_transformed = json_response.map { |el| el.except(:created_at, :updated_at) }

    expect(json_response_transformed).to match_array(posts_json)
  end

  it "should return proper HTTP status" do 
    expect(response).to have_http_status(200) # :ok
  end
end