class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @spots = @user.spots
    @like = @user.likes
  end
end
