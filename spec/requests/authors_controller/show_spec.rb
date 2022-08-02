require "rails_helper"

RSpec.describe "AuthorsController#show", type:  :request do
  let(:author) { create(:author) }

  before(:each) do 
    author
    get api_author_path(id: author.id)
  end

  it "should return proper JSON response" do 
    expect(json_response.except(:created_at, :updated_at)).to eq(author.as_json.except(:created_at, :updated_at))
  end

  it "should return proper HTTP status" do 
    expect(response).to have_http_status(200) # :ok
  end
end