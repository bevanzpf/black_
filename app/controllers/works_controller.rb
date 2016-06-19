class WorksController < ApplicationController
  before_action :admin_or_owner ,only: [:destroy]
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @work = current_user.works.build
  end

  def create
    @work = current_user.works.build(work_params)
    if @work.save
      flash[:success] = "Micropost created!"
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def destroy
   Work.find(params[:id]).destroy
   flash[:success] = "you have deleted a work"
   redirect_to user_path(current_user)
  end

  def show
    @work = Work.find(params[:id])
    @comments = @work.comments
    @comment = current_user.comments.build if logged_in?
  end

  private


  def work_params
    params.require(:work).permit(:subject, :desc, :picture)
  end

  def owner?(id)
    work = Work.find_by(id: id)
    work.make_by?(current_user)
  end
  def admin_or_owner
    unless current_user.admin? || owner?(params[:id])
      redirect_to root_url
    end
  end

end
