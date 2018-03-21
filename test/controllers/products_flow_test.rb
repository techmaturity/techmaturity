require 'test_helper'

class ProductsFlowTest < Capybara::Rails::TestCase
  setup do
    @product = FactoryBot.create(:product_with_tags)
  end

  test 'should not assess not assessable products' do
    @product.is_assessable = false
    @product.save

    visit product_url(@product)

    assert page.find('a.button--disabled[disabled="true"]')

    @product.is_assessable = true
    @product.save
  end
end