class HomeController < ApplicationController
  def index
    @overview = Page.find_by_slug("gioi-thieu")
    @feature_project_first = Project.where(feature: true).order(:id).first(3)
    @feature_project_last = Project.where(feature: true).order(:id).offset(3).first(3)
    @feature_product = Product.where(feature: true).take(8)
    @lasted_product = Product.where(lasted: true).take(8)
  end
end
