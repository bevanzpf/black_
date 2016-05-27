class StaticPagesController < ApplicationController
  def about
  end

  def home
    @works = Work.paginate(page: params[:page])
  end
end
