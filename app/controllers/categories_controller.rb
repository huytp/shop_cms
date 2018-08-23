class CategoriesController < ApplicationController
  def index
    @categories = Category.where(parent_id: 0)
    @all_categories = Category.pluck(:title, :id)
    @category = Category.new
  end

  def add_category
    Category.create(get_param)
    redirect_to categories_path
  end

  def delete_category
    Category.destroy(get_param_destroy)
    redirect_to categories_path
  end

  private

  def get_param
    params.require(:category).permit(:title, :slug, :parent_id)
  end

  def get_param_destroy
    params[:category][:parent_id]
  end

end
