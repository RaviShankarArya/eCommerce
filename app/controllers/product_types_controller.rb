class ProductTypesController < BaseController

  before_filter :set_navs, :parse_pagination_params, :only=>:index

end
