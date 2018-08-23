class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy, :get_category_current, :update_feature, :update_lasted]
  before_action :get_property_category, only: [:new, :edit, :create, :update]
  before_action :get_category_current, only: [:edit, :update]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def update_feature
    if @product.feature == true
      @product.feature = false
    else
      @product.feature = true
    end
    @product.save
    redirect_to products_path
  end
  def update_lasted
    if @product.lasted == true
      @product.lasted = false
    else
      @product.lasted = true
    end
    @product.save
    redirect_to products_path
  end
  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit

  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.property = params[:property].to_hash
    respond_to do |format|
      if @product.save
        (params[:products][:category_ids]).each {|id| @product.product_categories.create(category_id: id)}
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        @product.property = params[:property].to_hash
        @product.save
        @product.product_categories.destroy_all
        (params[:products][:category_ids]).each {|id| @product.product_categories.create(category_id: id)}
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def get_category_current
      @categories_select = @product.product_categories.pluck(:category_id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :slug, :meta_title, :meta_keyword, :meta_description, :old_price, :new_price, :sku, :image, :content)
    end

    def get_property_category
      @properties = Property.all
      @categories = Category.pluck(:title, :id)
    end
end
