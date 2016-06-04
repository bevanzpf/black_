class SessionsController < ApplicationController
  def new
    store_location request.referrer if request.referrer.present?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Account not activated."
        message += "Check your email for the activation link."
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
