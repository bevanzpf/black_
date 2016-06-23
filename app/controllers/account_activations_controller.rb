class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "帐号已激活!"
      redirect_to user
    else
      flash[:danger] = "链接非法."
      redirect_to root_url
    end
  end
end
