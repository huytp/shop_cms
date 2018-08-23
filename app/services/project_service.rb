class ProjectService
  def find_projects_by_category_slug slug
    category = CategoryProject.find_by_slug(slug)
    project_ids = ProjectCategory.where(category_project_id: category)
    project_ids = project_ids.present? ? project_ids.pluck(:project_id) : ""
    projects = Project.where(id: project_ids)
  end
end