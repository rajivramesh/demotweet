class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
    @followers = @current_user.followers
    @following = @current_user.following
  end
end