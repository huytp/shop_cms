require 'test_helper'

class PostViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_view_index_url
    assert_response :success
  end

  test "should get show" do
    get post_view_show_url
    assert_response :success
  end

end
