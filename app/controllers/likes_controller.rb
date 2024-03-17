class LikesController < ApplicationController
    before_action :authenticate_user
  
    def create
      discussion_thread = DiscussionThread.find(params[:discussion_thread_id])
      like = discussion_thread.likes.find_by(user: current_user)
  
      if like
        like.destroy
        redirect_to discussion_thread, notice: 'You have unliked this post.'
      else
        discussion_thread.likes.create(user: current_user)
        redirect_to discussion_thread, notice: 'You liked this post.'
      end
    end
  end
  