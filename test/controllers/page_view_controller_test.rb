require 'test_helper'

class PageViewControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get page_view_show_url
    assert_response :success
  end

end
