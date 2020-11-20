class CatesController < ApplicationController

  def index
    @spots = Spot.where(category_id: params[:category_id])
  end
end
