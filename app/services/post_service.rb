class PostService
  def find_category_post_name slug
    catgory = CategoryPost.find_by_slug(slug)
    name = catgory.present? ? catgory.title : ""
    name
  end
end