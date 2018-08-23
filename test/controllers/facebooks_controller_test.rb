require 'test_helper'

class FacebooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facebook = facebooks(:one)
  end

  test "should get index" do
    get facebooks_url
    assert_response :success
  end

  test "should get new" do
    get new_facebook_url
    assert_response :success
  end

  test "should create facebook" do
    assert_difference('Facebook.count') do
      post facebooks_url, params: { facebook: { app_id: @facebook.app_id, comment_active: @facebook.comment_active, like_active: @facebook.like_active } }
    end

    assert_redirected_to facebook_url(Facebook.last)
  end

  test "should show facebook" do
    get facebook_url(@facebook)
    assert_response :success
  end

  test "should get edit" do
    get edit_facebook_url(@facebook)
    assert_response :success
  end

  test "should update facebook" do
    patch facebook_url(@facebook), params: { facebook: { app_id: @facebook.app_id, comment_active: @facebook.comment_active, like_active: @facebook.like_active } }
    assert_redirected_to facebook_url(@facebook)
  end

  test "should destroy facebook" do
    assert_difference('Facebook.count', -1) do
      delete facebook_url(@facebook)
    end

    assert_redirected_to facebooks_url
  end
end
