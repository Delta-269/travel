class TravelsController < ApplicationController
  def index
    @spots = Spot.all.order("created_at DESC").limit(9)
  end
end
