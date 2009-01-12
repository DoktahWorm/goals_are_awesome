class HomeController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  before_filter :redirect_if_not_logged_in

  def index
  end

end