class DiscussionThreadsController < ApplicationController
  before_action :set_discussion_thread, only: [:show, :edit, :update, :destroy]

  def new
    @discussion_thread = DiscussionThread.new
  end

  def create
    @discussion_thread = current_user.discussion_threads.build(discussion_thread_params)
    if @discussion_thread.save
      redirect_to root_path, notice: 'Thread was successfully created.'
    else
      render :new
    end
  end
  
  def show
    # @discussion_thread is set by the before_action
  end

  def edit
    # Code for edit action (if you have an edit view)
  end

  def update
    if @discussion_thread.update(discussion_thread_params)
      redirect_to @discussion_thread, notice: 'Thread was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @discussion_thread.destroy
    redirect_to root_path, notice: 'Thread was successfully deleted.'
  end

  private

  def set_discussion_thread
    @discussion_thread = DiscussionThread.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Discussion thread not found."
    redirect_to root_path
  end

  def discussion_thread_params
    # Ensure this method only includes the parameters you want to permit
    params.require(:discussion_thread).permit(:title, :content, :locked)
  end
end
