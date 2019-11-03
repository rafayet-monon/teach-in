class Api::V1::BaseController < ActionController::Base
  include Response # concern to handle responses

  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller? # permit extra parameter for signup and account update
  around_action :set_current_user

  alias_method :current_user, :current_api_v1_user
  alias_method :authenticate_user!, :authenticate_api_v1_user!

  def set_current_user
    User.current = User.find_by_id(current_user.id) if !current_user.nil?

    yield
  ensure
    User.current = nil
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:phone_number, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end