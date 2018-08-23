require 'test_helper'

class FacebookAdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facebook_admin = facebook_admins(:one)
  end

  test "should get index" do
    get facebook_admins_url
    assert_response :success
  end

  test "should get new" do
    get new_facebook_admin_url
    assert_response :success
  end

  test "should create facebook_admin" do
    assert_difference('FacebookAdmin.count') do
      post facebook_admins_url, params: { facebook_admin: { admin_id: @facebook_admin.admin_id } }
    end

    assert_redirected_to facebook_admin_url(FacebookAdmin.last)
  end

  test "should show facebook_admin" do
    get facebook_admin_url(@facebook_admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_facebook_admin_url(@facebook_admin)
    assert_response :success
  end

  test "should update facebook_admin" do
    patch facebook_admin_url(@facebook_admin), params: { facebook_admin: { admin_id: @facebook_admin.admin_id } }
    assert_redirected_to facebook_admin_url(@facebook_admin)
  end

  test "should destroy facebook_admin" do
    assert_difference('FacebookAdmin.count', -1) do
      delete facebook_admin_url(@facebook_admin)
    end

    assert_redirected_to facebook_admins_url
  end
end
