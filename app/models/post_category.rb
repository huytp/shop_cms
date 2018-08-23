class PostCategory < ApplicationRecord
  belongs_to :post
  belongs_to :category_post
end