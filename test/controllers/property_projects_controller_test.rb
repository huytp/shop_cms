require 'test_helper'

class PropertyProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_project = property_projects(:one)
  end

  test "should get index" do
    get property_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_property_project_url
    assert_response :success
  end

  test "should create property_project" do
    assert_difference('PropertyProject.count') do
      post property_projects_url, params: { property_project: { name: @property_project.name, slug: @property_project.slug } }
    end

    assert_redirected_to property_project_url(PropertyProject.last)
  end

  test "should show property_project" do
    get property_project_url(@property_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_project_url(@property_project)
    assert_response :success
  end

  test "should update property_project" do
    patch property_project_url(@property_project), params: { property_project: { name: @property_project.name, slug: @property_project.slug } }
    assert_redirected_to property_project_url(@property_project)
  end

  test "should destroy property_project" do
    assert_difference('PropertyProject.count', -1) do
      delete property_project_url(@property_project)
    end

    assert_redirected_to property_projects_url
  end
end
