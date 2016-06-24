class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :detect_device_format
  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "请登录."
      redirect_to login_url
    end
  end

  def detect_device_format
    case request.user_agent
    when /iPhone/i
      session[:mobile] = 1
    when /Android/i && /mobile/i
      session[:mobile] = 1
    when /Windows Phone/i
      session[:mobile] = 1
    else
      session.delete(:mobile)
    end
  end

  def get_per_page
    if session[:mobile] != nil
      per_page = 6
    else
      per_page = 30
    end
  end

end
