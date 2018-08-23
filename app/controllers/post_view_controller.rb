class PostViewController < ApplicationController
  before_action :sidebar, only: [:index, :show]
  def index
    @posts = share_service.find_posts_by_category_slug get_post_category_slug
    @category_name = post_service.find_category_post_name(get_post_category_slug)
  end

  def show
    @post = Post.find_by_slug get_post_slug
    @facebook = Facebook.first
  end

  def sidebar
    @category_products = share_service.get_cate_product_and_news[0]
    @news = share_service.get_cate_product_and_news[1]
  end

  private
  def share_service
    @share_service ||= ::ShareService.new
  end

  def post_service
    @post_service ||= ::PostService.new
  end

  def get_post_category_slug
    params[:slug_cate]
  end

  def get_post_slug
    params[:slug_post]
  end
end
