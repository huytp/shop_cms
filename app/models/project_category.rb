class ProjectCategory < ApplicationRecord
  belongs_to :category_project
  belongs_to :project
end
