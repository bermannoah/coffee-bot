class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  include ActionView::Helpers::DateHelper

  def current_user
    @current_user ||= SlackLoginUser.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    if current_user.nil?
      render file: "/public/404", status: 404, layout: false
    else
      current_user
    end
  end

end
