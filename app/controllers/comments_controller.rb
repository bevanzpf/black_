class CommentsController < ApplicationController
  before_action :logged_in_user, only:[:create, :destroy]
  def create
    @work = Work.find(params[:comment][:work_id])
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "评论成功"
      redirect_to  work_path(@work)
    else
      flash[:danger] = @comment.errors.full_messages.to_s
      redirect_to work_path(@work)
    end
  end

  def destroy
  end

  private


  def comment_params
    params.require(:comment).permit(:body, :work_id)
  end
end
