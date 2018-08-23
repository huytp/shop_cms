class Category < ApplicationRecord
  has_many :products, through: :product_categories
  has_many :product_categories
  has_many :childs, class_name: "Category",
                          foreign_key: "parent_id", dependent: :destroy
end
