require "rails_helper"

RSpec.describe "CommentsController#show", type:  :request do
  let(:post) { create(:post) }
  let(:comment) { create(:post, post_id: post.id) }

  before(:each) do 
    comment
    get api_post_comment(post_id: post.id, id: comment.id)
  end

  it "should return proper JSON response" do 
    expect(json_response.except(:created_at, :updated_at)).to eq(comment.as_json.except(:created_at, :updated_at))
  end

  it "should return proper HTTP status" do 
    expect(response).to have_http_status(200) # :ok
  end
end