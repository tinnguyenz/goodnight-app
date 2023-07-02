class UsersController < ApplicationController
  def follow
    user = User.find(params[:id])
    current_user.follow(user)
    render json: { message: 'Successfully followed user.' }
  end

  def unfollow
    user = User.find(params[:id])
    current_user.unfollow(user)
    render json: { message: 'Successfully unfollowed user.' }
  end
end