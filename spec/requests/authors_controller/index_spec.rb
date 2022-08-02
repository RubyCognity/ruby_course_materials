require "rails_helper"

RSpec.describe "AuthorsController#index", type:  :request do
  let(:authors) { create_list(:author, 3) }

  before(:each) do
    authors
    get api_authors_path
  end

  it "should return proper JSON response" do 
    comments_json = authors.map { |el| el.as_json.except(:created_at, :updated_at) }
    json_response_transformed = json_response.map { |el| el.except(:created_at, :updated_at) }

    expect(json_response_transformed).to match_array(comments_json)
  end

  it "should return proper HTTP status" do 
    expect(response).to have_http_status(200) # :ok
  end
end