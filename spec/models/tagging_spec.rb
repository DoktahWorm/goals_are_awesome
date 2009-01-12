require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tagging do
  before(:each) do
    @valid_attributes = {
      :tag_id => ,
      :taggable_id => ,
      :taggable_type => "value for taggable_type"
    }
  end

  it "should create a new instance given valid attributes" do
    Tagging.create!(@valid_attributes)
  end
end
