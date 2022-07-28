require 'test_helper'

class Api::PostsController::CreateTest < ActionController::TestCase
  test '#create' do 
    post_content = 'post content'
    post :create, params: { post: { content: post_content } }
    assert_equal Post.count, 1
    assert_equal Post.last.content, post_content
  end

  test '#create validation error' do 
    post_content = ''
    post :create, params: { post: { content: post_content } }
    assert_equal "{\"content\":[\"can't be blank\"]}", @response.body
  end
end