class ApplicationController < ActionController::Base

  # Pundit
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to request.headers["Referer"] || root_path
  end

end
