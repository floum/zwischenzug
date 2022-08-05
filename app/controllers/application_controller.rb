class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  before_action :current_user

  def current_user
    return unless session[:user_id]
    begin
      @current_user ||= User.find(session[:user_id])
    rescue Mongoid::Errors::DocumentNotFound
      session[:user_id] = nil
      flash[:alert] = 'Invalid Session, You have been signed out.'
      @current_user = NullUser.new
      redirect_to root_path
    end
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
