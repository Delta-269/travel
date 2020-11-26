class TravelsController < ApplicationController
  def index
    @spots = Spot.includes(:user).order("created_at DESC").limit(9)
  end
end
