class CategoryProjectsController < ApplicationController
  before_action :set_category_project, only: [:show, :edit, :update, :destroy]

  def index
    @categories = CategoryProject.where(parent_id: 0)
    @all_categories = CategoryProject.pluck(:title, :id)
    @category = CategoryProject.new
  end

  def add_category
    CategoryProject.create(category_project_params)
    redirect_to category_projects_path
  end

  def delete_category
    CategoryProject.destroy(get_param_destroy)
    redirect_to category_projects_path
  end

  private
    def category_project_params
      params.require(:category_project).permit(:title, :slug, :parent_id)
    end

    def get_param_destroy
      params[:category_project][:parent_id]
    end
end
