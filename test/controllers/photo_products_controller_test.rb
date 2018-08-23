require 'test_helper'

class PhotoProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo_product = photo_products(:one)
  end

  test "should get index" do
    get photo_products_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_product_url
    assert_response :success
  end

  test "should create photo_product" do
    assert_difference('PhotoProduct.count') do
      post photo_products_url, params: { photo_product: { image: @photo_product.image } }
    end

    assert_redirected_to photo_product_url(PhotoProduct.last)
  end

  test "should show photo_product" do
    get photo_product_url(@photo_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_photo_product_url(@photo_product)
    assert_response :success
  end

  test "should update photo_product" do
    patch photo_product_url(@photo_product), params: { photo_product: { image: @photo_product.image } }
    assert_redirected_to photo_product_url(@photo_product)
  end

  test "should destroy photo_product" do
    assert_difference('PhotoProduct.count', -1) do
      delete photo_product_url(@photo_product)
    end

    assert_redirected_to photo_products_url
  end
end
