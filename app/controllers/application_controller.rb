class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include DisplayHelper
  include FlashHelper
  include ImageHelper
  include NavigationHelper
  include ParamsParserHelper
  include TitleHelper
  include ApplicationHelper
end
