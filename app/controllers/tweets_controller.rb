class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = @current_user.followers.joins(:tweets).where("tweets.user_id IN (?)", @current_user.followers.pluck(:following_id))
  end

  def create
    if params[:tweet][:message].blank?
      render json: {error: 'Please proivde valid parameters'}
      return

    end
    tweet = @current_user.tweets.create(message: params[:tweet][:message])

    render json: {id: tweet.id, message: tweet.message}
  end
end