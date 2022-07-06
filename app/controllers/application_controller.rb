class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    current_user
  end

  def require_login
    unless current_user
      redirect_to new_session_path
    end
  end
end
