class ProductService
  def find_products_by_category_slug slug
    category = Category.find_by_slug(slug)
    product_ids = ProductCategory.where(category_id: category)
    product_ids = product_ids.present? ? product_ids.pluck(:product_id) : ""
    products = Product.where(id: product_ids)
  end

  def find_category_product_name slug
    catgory = Category.find_by_slug(slug)
    name = catgory.present? ? catgory.title : ""
    name
  end
end