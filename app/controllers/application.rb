# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '0c90ab060495177df923e40fd92ee774'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  
  filter_parameter_logging :password

  include AuthenticatedSystem

  private
  
  def redirect_if_not_logged_in
    redirect_to :controller => 'login' unless logged_in?
  end

end
