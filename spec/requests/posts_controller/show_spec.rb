require "rails_helper"

RSpec.describe "PostsController#show", type:  :request do
  let(:post) { create(:post) }

  before(:each) do 
    get api_post_path(post)
  end

  it "should return proper JSON response" do 
    expect(json_response.except(:created_at, :updated_at)).to eq(post.as_json.except(:created_at, :updated_at))
  end

  it "should return proper HTTP status" do 
    expect(response).to have_http_status(200) # :ok
  end
end