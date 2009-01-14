require File.dirname(__FILE__) + '/../test_helper'

class TagTest < Test::Unit::TestCase
  fixtures :goals  
  def setup
    @obj = Goal.find(:first)
    @obj.tag_with "pale imperial"
  end

  def test_to_s
    assert_equal "imperial pale", Goal.find(:first).tags.to_s
  end
  
end
