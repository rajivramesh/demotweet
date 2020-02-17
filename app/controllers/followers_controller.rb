class FollowersController < ApplicationController

  def follow
    if params[:following_id].blank?
      render json: {error: 'Please provide user whom to follow'}
      return
    end


    following_user = User.find_by_id(params[:following_id])

    if following_user.blank?
      render json: {error: 'Please proivde valid user to follow'}
      return
    end

    if !following_user.followers.pluck(:following_id).include?(@current_user.id)
      @current_user.following.create(following_id: following_user.id)
      render json: {message: "You followed user sucessfully"}
    else
      render json: {error: 'Already following.'}
      return
    end 
  end

  def unfollow
    if params[:unfollow_id].blank?
      render json: {error: 'Please provide user to unfollow'}
      return
    end

    unfollow_user = @current_user.following.where(following_id: params[:unfollow_id]).last
    if unfollow_user.present?
      unfollow_user.destroy
      render json: {error: 'Sucessfully unfollowed user'}
      return
    else
      render json: {error: 'Not a valid user'}
      return
    end
  end
end