require 'test_helper'

class ProductViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_view_index_url
    assert_response :success
  end

  test "should get show" do
    get product_view_show_url
    assert_response :success
  end

end
