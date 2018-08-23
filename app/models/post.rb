class Post < ApplicationRecord
  has_many :category_posts, through: :post_categories
  has_many :post_categories
  has_attached_file :image, styles: {small: "200x800>", large: "336x250!>"}
  validates_attachment :image, presence: true, content_type: {content_type: ["image/jpeg", "image/jpg", "image/png", "image/gif"]}
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :content, presence: true
end
