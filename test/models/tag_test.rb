require 'test_helper'

class TagTest < ActiveSupport::TestCase

  test "tag factory all kinds should work" do
    # just making sure these all work, these
    # two lines are the snippets we use with
    # our list of keys
    TagKeyHelper.tag_keys.each do | k |
      "#{k.partition('.').last}"
      "#{eval(k)}"
    end
  end

end
