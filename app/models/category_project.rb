class CategoryProject < ApplicationRecord
  has_many :projects, through: :project_categories
  has_many :project_categories
  has_many :childs, class_name: "CategoryProject",
                          foreign_key: "parent_id", dependent: :destroy
end
