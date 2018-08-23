module PostsHelper
  def get_category_ids
    CategoryPost.all.select([:title, :id]).collect {|category| [category.title, category.id]}
  end
end
