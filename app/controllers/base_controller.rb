class BaseController < ApplicationController

  # before_filter :require_admin
  layout 'admin'

  protected

  # def current_admin
  #   @current_admin ||= Admin.find_by_id(session[:admin_id])
  # end

  # def store_session
  #   session[:admin_id] = @current_admin.id
  # end

  # def require_admin
  #   unless current_admin
  #     @heading = translate("authentication.error")
  #     @alert = translate("authentication.invalid_token")
  #     store_flash_message("#{@heading}: #{@alert}", :errors)
  #     redirect_to admin_sign_in_url
  #   end
  # end

  # def redirect_url_if_sign_in_fails
  #   admin_sign_in_url
  # end

  # def redirect_url_after_sign_in
  #   admin_home_url
  # end

  # def redirect_url_after_sign_out
  #   admin_sign_in_url
  # end

  # def redirect_if_signed_in
  #   redirect_to redirect_url_after_sign_in if current_admin
  # end

  # def redirect_unless_signed_in
  #   redirect_to redirect_url_if_sign_in_fails unless current_admin
  # end

  def respond_index(object)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: object }
      format.js {}
    end
  end

end
