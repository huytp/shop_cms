require 'test_helper'

class CategoryProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_project = category_projects(:one)
  end

  test "should get index" do
    get category_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_category_project_url
    assert_response :success
  end

  test "should create category_project" do
    assert_difference('CategoryProject.count') do
      post category_projects_url, params: { category_project: { slug: @category_project.slug, title: @category_project.title } }
    end

    assert_redirected_to category_project_url(CategoryProject.last)
  end

  test "should show category_project" do
    get category_project_url(@category_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_project_url(@category_project)
    assert_response :success
  end

  test "should update category_project" do
    patch category_project_url(@category_project), params: { category_project: { slug: @category_project.slug, title: @category_project.title } }
    assert_redirected_to category_project_url(@category_project)
  end

  test "should destroy category_project" do
    assert_difference('CategoryProject.count', -1) do
      delete category_project_url(@category_project)
    end

    assert_redirected_to category_projects_url
  end
end
