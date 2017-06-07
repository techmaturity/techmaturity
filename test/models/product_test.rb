require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "does not return is_active=false" do
    p = Product.new
    p.name = 'test is active'
    p.product_type = 'soem type'
    p.save
    p.is_active = false
    p.save
    assert_raises(ActiveRecord::RecordNotFound) { Product.find p.id }
  end

  test "returns when is_sctive=true" do
    p = Product.new
    p.name = 'test is active'
    p.product_type = 'some type'
    p.save
    assert_equal(p.is_active, true)
    Product.find p.id
  end


end
