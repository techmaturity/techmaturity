require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test "should get new" do
    p = products(:one)
    get new_product_tag_url p.id
    assert_response :success
  end

  test "should create tag" do
    p = products(:one)
    assert_difference('Tag.count') do
      post product_tags_url p.id, params: { tag: { key: 'test key', value: 'test value' } }
    end
    assert_redirected_to product_url p.id
  end

  test "should get edit" do
    get edit_product_tag_url(@tag.product, @tag)
    assert_response :success
  end

  test "should update tag" do
    patch product_tag_url(@tag.product, @tag), params: { tag: { key: @tag.key, product_id: @tag.product_id, value: @tag.value } }
    assert_redirected_to product_url(@tag.product)
  end

  test "should destroy tag" do
    t = Tag.new
    t.product = @tag.product
    t.key = 'the key'
    t.value = 'the value'
    t.save
    assert_difference('Tag.count', -1) do
      delete product_tag_url(t.product, t)
    end
    assert_redirected_to product_url t.product
  end
end
