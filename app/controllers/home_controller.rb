class HomeController < ApplicationController
  def index
    @sorting_option = params[:sort_by] || 'date_posted'

    @discussion_threads = DiscussionThread.includes(:likes, :comments).all

    case @sorting_option
    when 'date_posted'
      @discussion_threads = @discussion_threads.order(created_at: :desc)
    when 'relevance'
      @discussion_threads = @discussion_threads.sort_by { |thread| -(thread.comments.count + thread.likes.count) }
    end
  end
end
