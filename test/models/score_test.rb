require 'test_helper'

class ScoreTest < ActiveSupport::TestCase

  setup do
    @score = FactoryGirl.create(:score)
  end

  test 'get_capability_array returns proper array' do
    assert_equal(@score.get_capability_array, [@score.a1.to_i,@score.a2.to_i,@score.a3.to_i,@score.a4.to_i,@score.a5.to_i,@score.a6.to_i,@score.a7.to_i,@score.a8.to_i,@score.a9.to_i,@score.a10.to_i,@score.a11.to_i,@score.a12.to_i,@score.b1.to_i,@score.b2.to_i,@score.b3.to_i,@score.b4.to_i,@score.b5.to_i,@score.b6.to_i,@score.b7.to_i,@score.b8.to_i,@score.c1.to_i,@score.c2.to_i,@score.c3.to_i,@score.c4.to_i,@score.c5.to_i,@score.c6.to_i,@score.c7.to_i,@score.c8.to_i,@score.c9.to_i,@score.c10.to_i,@score.d1.to_i,@score.d2.to_i,@score.d3.to_i,@score.d4.to_i,@score.d5.to_i,@score.d6.to_i,@score.d7.to_i,@score.d8.to_i,@score.e1.to_i,@score.e2.to_i,@score.e3.to_i,@score.e4.to_i])
  end

  test 'get_category_array returns the proper array' do
    assert_equal(@score.get_category_array, [@score.a.to_i, @score.b.to_i, @score.c.to_i, @score.d.to_i, @score.e.to_i])
  end

  test 'get_expanded_category_array returns the proper array' do
    assert_equal(@score.get_expanded_category_array, [[@score.a.to_i]*12, [@score.b.to_i]*8, [@score.c.to_i]*10, [@score.d.to_i]*8, [@score.e.to_i]*4].flatten)
  end

  test 'compute_segment sets the correct value' do
    l = [@score.e1,@score.e2,@score.e3,@score.e4]
    assert_equal(@score.send(:compute_segment, ['e1','e2','e3','e4']), l.reduce(:+) / l.size)
  end

  test 'compute_score computes the correct value' do
    test_score = 0
    keys = {}
    CAPABILITIES.each{|key, val| keys[key]=val unless (val.nil? || !key.end_with?("min")) }
    keys.each{|key,val| test_score+=1 unless (@score[key[0..-5]].nil? || @score[key[0..-5]]<val) }
    computed_score = test_score==0 ? 0.0 : (test_score.to_f / keys.count) * 100
    assert_equal(@score.send(:compute_score), computed_score)
  end


end
