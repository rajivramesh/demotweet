class TweetsController < ApplicationController

  def index
    @tweets = @current_user.followers.joins(:tweets).where("tweets.user_id IN (?)", @current_user.followers.pluck(:following_id))
  end
end