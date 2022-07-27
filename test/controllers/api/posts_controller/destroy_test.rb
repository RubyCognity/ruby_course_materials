require 'test_helper'

class Api::PostsController::DestroyTest < ActionController::TestCase
  def setup 
    @post = Post.create(content: 'Simple content')
  end

  test '#destroy' do 
    post_content = 'post content'
    delete :destroy, params: { id: @post.id }
    assert_equal Post.count, 0
  end
end