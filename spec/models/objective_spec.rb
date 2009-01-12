require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Objective do
  before(:each) do
    @valid_attributes = {
      :user_id => "1",
      :goal_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Objective.create!(@valid_attributes)
  end
end
