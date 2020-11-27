class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :spot_find, only: [:show, :edit, :update, :destroy]

  def index
    @spots = Spot.includes(:user).order("created_at DESC")
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @spot.comments.includes(:user)
    @like = Like.new
  end

  def edit
    @user = @spot.user
    if @user != current_user
      redirect_to action: :index
    end
  end

  def update
    if @spot.update(spot_params)
      redirect_to spot_path
    else
      render :edit
    end
  end

  def destroy
    @user = @spot.user.id
    if @user == current_user.id
      @spot.destroy
    end
    redirect_to action: :index
  end

  def search
    @spots = Spot.search(params[:keyword])
  end

  private

  def spot_params
    params.require(:spot).permit(:title, :category_id, :area_id, :address, :text, :image).merge(user_id: current_user.id)
  end

  def spot_find
    @spot = Spot.find(params[:id])
  end
end
