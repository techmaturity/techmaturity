require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "does not return is_active=false" do
    p = FactoryBot.create(:product_with_tags)
    p.is_active = false
    p.save
    assert_raises(ActiveRecord::RecordNotFound) { Product.find p.id }
  end

  test "returns when is_sctive=true" do
    p = FactoryBot.create(:product_with_tags)
    assert_equal(p.is_active, true)
    Product.find p.id
  end

end
