class ProductViewController < ApplicationController
  before_action :sidebar, only: [:index, :show]
  def index
    @products = product_service.find_products_by_category_slug get_product_category_slug
    @category_name = product_service.find_category_product_name get_product_category_slug
  end

  def show
    @product = Product.find_by_slug(params[:slug_pro])
    @facebook = Facebook.first
    @products = product_service.find_products_by_category_slug(get_product_category_slug).where("id != ?", @product.id)
  end

  def sidebar
    @category_products = share_service.get_cate_product_and_news[0]
    @news = share_service.get_cate_product_and_news[1]
  end

  private
  def share_service
    @share_service ||= ::ShareService.new
  end

  def product_service
    @product_service ||= ::ProductService.new
  end

  def get_product_category_slug
    params[:slug_cate]
  end
end
