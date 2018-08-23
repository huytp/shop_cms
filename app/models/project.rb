class Project < ApplicationRecord
  has_many :category_peojects, through: :project_categories
  has_many :project_categories
  has_many :photo_projects
  validates :slug, presence: true, uniqueness: true
  serialize :property, Hash
end
