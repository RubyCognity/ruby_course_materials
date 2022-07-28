require "rails_helper"

RSpec.describe "PostsController#destroy", type:  :request do
  let(:posts) { create_list(:post, 3) }

  before(:each) { posts }

  subject {  delete api_post_path(posts.first) }

  it "should delete post" do
    expect { subject }.to change(Post, :count).by(-1)
  end

  it "should return proper HTTP status" do 
    subject
    expect(response).to have_http_status(200) # :ok
  end
end