class LikesController < ApplicationController

  def index
  @spots = Spot.find(Like.group(:spot_id).order('count(spot_id) desc').limit(10).pluck(:spot_id))
  end

  def create
    @like = current_user.likes.create(spot_id: params[:spot_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(spot_id: params[:spot_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
