class CategoryPostsController < ApplicationController
    before_action :set_category_post, only: [:show, :edit, :update, :destroy]

  def index
    @categories = CategoryPost.where(parent_id: 0)
    @all_categories = CategoryPost.pluck(:title, :id)
    @category = CategoryPost.new
  end

  def add_category
    CategoryPost.create(category_post_params)
    redirect_to category_posts_path
  end

  def delete_category
    CategoryPost.destroy(get_param_destroy)
    redirect_to category_posts_path
  end

  private
    def category_post_params
      params.require(:category_post).permit(:title, :slug, :parent_id)
    end

    def get_param_destroy
      params[:category_post][:parent_id]
    end
end
