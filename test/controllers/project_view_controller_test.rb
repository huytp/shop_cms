require 'test_helper'

class ProjectViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_view_index_url
    assert_response :success
  end

  test "should get show" do
    get project_view_show_url
    assert_response :success
  end

end
