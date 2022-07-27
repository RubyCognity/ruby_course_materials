require 'test_helper'

class Api::PostsController::ShowTest < ActionController::TestCase
  def setup
    @post = Post.create(content: 'Some content')
  end

  def test_show
    get :show, params: { id: @post.id }
    assert_response 200
    assert_includes @post.to_json, @response.body
  end
end