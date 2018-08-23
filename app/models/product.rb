class Product < ApplicationRecord
  has_many :categories, through: :product_categories
  has_many :product_categories

  has_attached_file :image, styles: {small: "240x192!>", large: "409x327!>"}
  validates_attachment :image, presence: true, content_type: {content_type: ["image/jpeg", "image/jpg", "image/png", "image/gif"]}
  validates :sku, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  serialize :property, Hash
end
