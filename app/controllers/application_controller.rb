class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  def current_user
    session[:name]
  end

  def logged_in?
    session[:name].present?
  end
end
