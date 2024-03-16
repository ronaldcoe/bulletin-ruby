# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    @discussion_thread = DiscussionThread.find(params[:discussion_thread_id])
    @comment = @discussion_thread.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @discussion_thread, notice: 'Comment was successfully created.'
    else
      redirect_to @discussion_thread, alert: 'Comment could not be posted.'
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @discussion_thread = @comment.discussion_thread
    @comment.destroy
    redirect_to @discussion_thread, notice: 'Comment was successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authenticate_user
    redirect_to login_path, alert: 'You must be logged in to perform that action.' unless current_user
  end
end
