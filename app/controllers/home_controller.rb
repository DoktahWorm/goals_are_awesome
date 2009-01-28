class HomeController < ApplicationController

  before_filter :redirect_if_not_logged_in

  def index
  end

end