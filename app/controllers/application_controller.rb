class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  def current_user
    session[:name]
  end

  def logged_in?
    session[:due_date].present? && session[:due_date] > Time.zone.now && session[:name].present?
  end
end
