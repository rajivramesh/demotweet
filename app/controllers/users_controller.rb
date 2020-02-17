class UsersController < ApplicationController

  def profile
    @followers = @current_user.followers
    @following = @current_user.following
  end

  def tweets
  end
end