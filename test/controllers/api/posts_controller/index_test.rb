require 'test_helper'

class Api::PostsController::IndexTest < ActionController::TestCase
  def setup
    @post = Post.create(content: 'Some content')
  end

  def test_index
    get :index
    assert_response 200
    assert_includes [@post.as_json].to_json, @response.body
  end
end