class CategoryPost < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  has_many :posts, through: :post_categories
  has_many :post_categories
  has_many :childs, class_name: "CategoryPost",
                          foreign_key: "parent_id", dependent: :destroy
end
