require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tagging do
  before(:each) do
    @valid_attributes = {
      :tag_id => 1,
      :taggable_id => 1,
      :taggable_type => "Goal"
    }
  end

  it "should create a new instance given valid attributes" do
    Tagging.create!(@valid_attributes)
  end
end
