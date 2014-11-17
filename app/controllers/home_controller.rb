class HomeController < BaseController

  # before_filter :require_admin
  before_filter :set_navs, :only=>:index

  # GET /
  def index
  end

  private

  def set_navs
    set_nav("Home")
  end

end