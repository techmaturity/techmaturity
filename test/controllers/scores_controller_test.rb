require 'test_helper'

class ScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @score = FactoryBot.create(:score)
  end

  test "should get index" do
    get product_scores_url @score.product
    assert_response :success
  end

  test "should get new" do
    get new_product_score_url @score.product
    assert_response :success
  end

  test "should create score" do
    assert_difference('Score.count') do
      post product_scores_url @score.product, params: { score: { a10: @score.a10, a11: @score.a11, a12: @score.a12, a1: @score.a1, a2: @score.a2, a3: @score.a3, a4: @score.a4, a5: @score.a5, a6: @score.a6, a7: @score.a7, a8: @score.a8, a9: @score.a9, a: @score.a, b1: @score.b1, b2: @score.b2, b3: @score.b3, b4: @score.b4, b5: @score.b5, b6: @score.b6, b7: @score.b7, b8: @score.b8, b: @score.b, c10: @score.c10, c1: @score.c1, c2: @score.c2, c3: @score.c3, c4: @score.c4, c5: @score.c5, c6: @score.c6, c7: @score.c7, c8: @score.c8, c9: @score.c9, c: @score.c, d1: @score.d1, d2: @score.d2, d3: @score.d3, d4: @score.d4, d5: @score.d5, d6: @score.d6, d7: @score.d7, d8: @score.d8, d: @score.d, e1: @score.e1, e2: @score.e2, e3: @score.e3, e4: @score.e4, e: @score.e, product_id: @score.product_id, total: @score.total } }
    end
    assert_redirected_to product_url(@score.product)
  end

  test "should show score" do
    get product_score_url(@score.product, @score)
    assert_response :success
  end

end
