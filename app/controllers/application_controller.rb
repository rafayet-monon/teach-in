class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def request_from_admin?
    params[:controller] =~ /^admin\//i
  end

  def set_user_by_token(mapping = nil)
    # byepassing to active admin's own
    #   authentication process
    if request_from_admin?
      return (request.env['warden'].user(:admin_user)) || redirect_to(new_admin_user_session_path)
    else
      super
    end
  end

  # keep track of request duration
  def set_request_start
    # byepassing to active admin's own
    #   authentication process
    return true if request_from_admin?

    super
  end
end
