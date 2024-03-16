class HomeController < ApplicationController
  def index
    @discussion_threads = DiscussionThread.all
  end
end
