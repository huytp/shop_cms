class Page < ApplicationRecord
  has_attached_file :image, styles: {small: "200x800>", large: "700x2000>"}
  validates_attachment :image, presence: true, content_type: {content_type: ["image/jpeg", "image/jpg", "image/png", "image/gif"]}
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :content, presence: true
end
