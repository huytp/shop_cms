require 'test_helper'

class CategoryPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_post = category_posts(:one)
  end

  test "should get index" do
    get category_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_category_post_url
    assert_response :success
  end

  test "should create category_post" do
    assert_difference('CategoryPost.count') do
      post category_posts_url, params: { category_post: { name: @category_post.name, slug: @category_post.slug } }
    end

    assert_redirected_to category_post_url(CategoryPost.last)
  end

  test "should show category_post" do
    get category_post_url(@category_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_post_url(@category_post)
    assert_response :success
  end

  test "should update category_post" do
    patch category_post_url(@category_post), params: { category_post: { name: @category_post.name, slug: @category_post.slug } }
    assert_redirected_to category_post_url(@category_post)
  end

  test "should destroy category_post" do
    assert_difference('CategoryPost.count', -1) do
      delete category_post_url(@category_post)
    end

    assert_redirected_to category_posts_url
  end
end
