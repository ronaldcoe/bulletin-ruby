class HomeController < ApplicationController
  def index
    @sorting_option = params[:sort_by] || 'date_posted'

    # Start with all threads or only current user's threads based on the filter
    if params[:sort_by] == 'my_threads'
      @discussion_threads = DiscussionThread.includes(:likes, :comments).where(user: current_user)
    else
      @discussion_threads = DiscussionThread.includes(:likes, :comments).all
    end

    # Apply sorting based on the selected option
    case @sorting_option
    when 'date_posted'
      @discussion_threads = @discussion_threads.order(created_at: :desc)
    when 'relevance'
      # Convert to an array for sorting by relevance since it involves calculation
      @discussion_threads = @discussion_threads.to_a.sort_by { |thread| -(thread.comments.count + thread.likes.count) }
    end
  end
end
