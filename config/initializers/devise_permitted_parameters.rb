module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :firstname, :middlename, :lastname, :nickname) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :firstname, :middlename, :lastname, :nickname) }
  end

=begin
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) << :name
    devise_parameter_sanitizer.permit(:account_update) << :name
  end
=end

end

DeviseController.send :include, DevisePermittedParameters
