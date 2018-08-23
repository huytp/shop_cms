module ProductsHelper
  def get_product_name product
    product.product_categories.pluck(:category_id).collect{|category| Category.find(category).title}
  end
end
