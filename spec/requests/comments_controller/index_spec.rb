require "rails_helper"

RSpec.describe "CommentsController#index", type:  :request do
  let(:post) { create(:post) }
  let(:comments) { create_list(:comment, 3, post_id: post.id) }

  before(:each) do
    comments
    get api_post_comments_path(post_id: post.id)
  end

  it "should return proper JSON response" do 
    comments_json = comments.map { |el| el.as_json.except(:created_at, :updated_at) }
    json_response_transformed = json_response.map { |el| el.except(:created_at, :updated_at) }

    expect(json_response_transformed).to match_array(comments_json)
  end

  it "should return proper HTTP status" do 
    expect(response).to have_http_status(200) # :ok
  end
end