class DiscussionThreadsController < ApplicationController
  before_action :set_discussion_thread, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  before_action :check_owner, only: [:edit, :update, :destroy]


  def index
    @discussion_threads = DiscussionThread.all
  end
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
    @discussion_thread = DiscussionThread.find(params[:id])
    if current_user.id == @discussion_thread.user_id
      @discussion_thread.destroy
      redirect_to root_path, notice: 'Thread was successfully deleted.'
    else
      redirect_to @discussion_thread, alert: 'You are not authorized to delete this thread.'
    end
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


  def authenticate_user
    redirect_to login_path, alert: 'You must be logged in to perform that action.' unless current_user
  end

  private

  def check_owner
    @discussion_thread = DiscussionThread.find(params[:id])
    unless current_user && current_user.id == @discussion_thread.user_id
      redirect_to discussion_threads_path, alert: "You are not authorized to edit this thread."
    end
  end




end
