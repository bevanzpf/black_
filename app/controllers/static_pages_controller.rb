class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:feed]
  def about
  end

  def home
    @works = Work.paginate(page: params[:page],per_page: get_per_page )
  end

  def feed
   @works = current_user.feed.paginate(page: params[:page], per_page: get_per_page)
  end

  def popular
    @works = Work.unscoped.popular.paginate(page: params[:page], per_page: get_per_page)
  end

  private



end
