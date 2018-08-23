class PhotoProject < ApplicationRecord
  belongs_to :project
  has_attached_file :image, styles: {small: "165x110!>", medium: "272x175!>", large: "700x2000>"}
  validates_attachment :image, presence: true, content_type: {content_type: ["image/jpeg", "image/jpg", "image/png", "image/gif"]}
end
