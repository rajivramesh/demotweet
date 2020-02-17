class TweetsController < ApplicationController

  def index
    @twets = @current_user.followers.include(:tweets)
  end
end