class ProjectViewController < ApplicationController
  def index
    @projects = project_service.find_projects_by_category_slug get_project_category_slug
  end

  def show
    @project = Project.find_by_slug(params[:slug_project])
    @facebook = Facebook.first
  end

  private

  def project_service
    @project_service ||= ::ProjectService.new
  end

  def get_project_category_slug
    params[:slug_cate]
  end
end
