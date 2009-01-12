require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Goal do
  before(:each) do
    @valid_attributes = {
      :short_desc => "value for short_desc",
      :long_desc => "value for long_desc",
      :complete => false,
      :target_completion_date => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Goal.create!(@valid_attributes)
  end
end
