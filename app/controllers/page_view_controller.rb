class PageViewController < ApplicationController
  def show
    @page = Page.find_by_slug(params[:slug])
    @category_products = share_service.get_cate_product_and_news[0]
    @news = share_service.get_cate_product_and_news[1]
  end

  private
  def share_service
    @share_service ||= ::ShareService.new
  end
end
