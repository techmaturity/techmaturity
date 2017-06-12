require 'test_helper'

class ScoreTest < ActiveSupport::TestCase

  setup do
    @score = FactoryGirl.create(:score)
  end

  test 'get_capability_array should return proper array' do
    assert_equal(@score.get_capability_array, [@score.a1.to_i,@score.a2.to_i,@score.a3.to_i,@score.a4.to_i,@score.a5.to_i,@score.a6.to_i,@score.a7.to_i,@score.a8.to_i,@score.a9.to_i,@score.a10.to_i,@score.a11.to_i,@score.a12.to_i,@score.b1.to_i,@score.b2.to_i,@score.b3.to_i,@score.b4.to_i,@score.b5.to_i,@score.b6.to_i,@score.b7.to_i,@score.b8.to_i,@score.c1.to_i,@score.c2.to_i,@score.c3.to_i,@score.c4.to_i,@score.c5.to_i,@score.c6.to_i,@score.c7.to_i,@score.c8.to_i,@score.c9.to_i,@score.c10.to_i,@score.d1.to_i,@score.d2.to_i,@score.d3.to_i,@score.d4.to_i,@score.d5.to_i,@score.d6.to_i,@score.d7.to_i,@score.d8.to_i,@score.e1.to_i,@score.e2.to_i,@score.e3.to_i,@score.e4.to_i])
  end

end
