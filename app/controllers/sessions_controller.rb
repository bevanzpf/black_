class SessionsController < ApplicationController
  def new
    if request.referrer.present? && session[:forwarding_url] == nil
       store_location request.referrer
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "帐号还没激活,"
        message += "请查看注册邮箱点击链接激活."
        flash[:danger] = message
        redirect_to root_url
      end
      #
    else
      flash.now[:danger] = '密码或帐号名出错'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
