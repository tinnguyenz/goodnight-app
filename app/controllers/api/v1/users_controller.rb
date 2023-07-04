class Api::V1::UsersController < ApplicationController
  def follow
    user = User.find(params[:id])

    if current_user.following?(user)
      render json: { message: "#{user.name} is already being followed." }
    else
      current_user.follow(user.id)
      render json: { message: "Successfully followed #{user.name}." }
    end
  end

  def unfollow
    user = User.find(params[:id])
    current_user.unfollow(user.id)
    render json: { message: 'Successfully unfollowed user.' }
  end
end
