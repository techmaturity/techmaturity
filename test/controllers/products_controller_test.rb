require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = FactoryBot.create(:product_with_tags)
  end

  test 'should get index' do
    get products_url
    assert_response :success
  end

  test 'should get new' do
    get new_product_url
    assert_response :success
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post products_url, params: { product: { name: 'test product creation', product_type: 'test type' } }
    end
    assert_redirected_to product_url(Product.last)
  end

  test 'should show product' do
    get product_url(@product)
    assert_response :success
  end

  test 'should get edit' do
    get edit_product_url(@product)
    assert_response :success
  end

  test 'should update product' do
    patch product_url(@product), params: { product: { name: @product.name, product_type: @product.product_type } }
    assert_redirected_to product_url(@product)
  end

  test 'should soft delete product' do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_equal(Product.unscoped.count, (Product.count + 1))

    assert_redirected_to products_url
  end

  test 'should redirect new page if enable_asset_creation is false' do
    before_enable_asset_creation_setting = CONFIGS[:enable_asset_creation]
    CONFIGS[:enable_asset_creation] = false

    get new_product_url
    assert_redirected_to '/' 

    CONFIGS[:enable_asset_creation] = before_enable_asset_creation_setting
  end

end
