require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GoalsController do

  describe "a user is signed in", :shared => true do
    before( :each ) do
      controller.stub!( :login_required )
      # controller.stub!( :current_user ).returns(Mock("User"))
      # must mock user and goals, probably
    end
  end
  
  describe "creating a new goal" do
    it_should_behave_like "a user is signed in"

    it "should display new page" do
      get :new
      assigns[:goal].should be_kind_of( Goal )
    end  
  end

  describe "as user not signed in" do
  
    def response_should_redirect_to_login_from page
      get page
      response.should redirect_to(login_path)  
    end
  
    it "should forward from index to login page" do
      response_should_redirect_to_login_from :index
    end
  
    it "should forward from show to login page" do
      response_should_redirect_to_login_from :show
    end

    it "should forward from new to login page" do
      response_should_redirect_to_login_from :new
    end
  
    it "should forward from create to login page" do
      response_should_redirect_to_login_from :create
    end
  
    it "should forward from update to login page" do
      response_should_redirect_to_login_from :update
    end
  
    it "should forward from destroy to login page" do
      response_should_redirect_to_login_from :destroy
    end
    
  end
  
  
end

# describe GoalsController do
# 
#   #Delete these examples and add some real ones
#   it "should use GoalsController" do
#     controller.should be_an_instance_of(GoalsController)
#   end
# 
# 
#   # describe "GET 'index'" do
#   #   it "should be successful" do
#   #     get 'index'
#   #     response.should be_success
#   #   end
#   # end
#   # 
#   # describe "GET 'new'" do
#   #   it "should be successful" do
#   #     get 'new'
#   #     response.should be_success
#   #   end
#   # end
#   # 
#   # describe "GET 'create'" do
#   #   it "should be successful" do
#   #     get 'create'
#   #     response.should be_success
#   #   end
#   # end
#   # 
#   # describe "GET 'edit'" do
#   #   it "should be successful" do
#   #     get 'edit'
#   #     response.should be_success
#   #   end
#   # end
#   # 
#   # describe "GET 'update'" do
#   #   it "should be successful" do
#   #     get 'update'
#   #     response.should be_success
#   #   end
#   # end
#   # 
#   # describe "GET 'destroy'" do
#   #   it "should be successful" do
#   #     get 'destroy'
#   #     response.should be_success
#   #   end
#   # end
# end
