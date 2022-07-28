require 'test_helper'

class Api::PostsController::UpdateTest < ActionController::TestCase
  def setup 
    @post = Post.create(content: 'Simple content')
  end

  test '#update' do 
    post_content = 'updated content'
    patch :update, params: { post: { content: post_content }, id: @post.id }
    assert_equal post_content, @post.reload.content
  end

  test '#update validation error' do 
    post_content = ''
    post :update, params: { post: { content: post_content }, id: @post.id }
    assert_equal "{\"content\":[\"can't be blank\"]}", @response.body
  end
end