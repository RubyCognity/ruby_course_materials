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
end