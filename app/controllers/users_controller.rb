class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "删除了一个用户"
    redirect_to users_url
  end
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @works = @user.works.paginate(page: params[:page], per_page: get_per_page)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "注册成功，请查收邮件以激活."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "更新成功."
      redirect_to @user

    else
      render 'edit'
    end
  end

  def following
    @title = "正在关注"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: get_per_page)
    render 'show_follow'
  end

  def followers
    @title = "关注者"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page],per_page: get_per_page)
    render 'show_follow'
  end

  def liking
    @user = User.find(params[:id])
    @works = @user.liking_works.paginate(page: params[:page], per_page: get_per_page)
    render 'liking'
  end

  private


  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
  end


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
