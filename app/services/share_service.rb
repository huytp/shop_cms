class ShareService
  def get_cate_product_and_news
    category_products = Category.all
    news = find_posts_by_category_slug("tin-tuc").order(created_at: :DESC).first(5)
    [category_products, news]
  end

  def find_posts_by_category_slug slug
    category_post = CategoryPost.find_by_slug(slug)
    news_ids = PostCategory.where(category_post_id: category_post)
    news_ids = news_ids.present? ? news_ids.pluck(:post_id) : ""
    news = Post.where(id: news_ids, active: true)
  end
end