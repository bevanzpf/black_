class LikesController < ApplicationController

  def create
    @like = current_user.likes.build(work_id: params[:work_id])
    @work = @like.work
    respond_to do |format|
      if @like.save
        format.js {}
      end
    end
  end

  def destroy
    like = current_user.likes.where(work_id: params[:work_id]).first
    @work = like.work
    like.destroy
    respond_to do |format|
      format.js {}
    end
  end
end
