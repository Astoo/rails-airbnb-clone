class FriendsController < ApplicationController

  before_action :set_friend, only: [:show, :update, :destroy]
  def index
    @friends = Friend.all
  end

  def show
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friends_params)
    @friend.user = current_user
    if @friend.save
      redirect_to friend_path(@friend)
    else
      render :new
    end
  end

  def destroy
    @friend.destroy
  end

  def update
    @friend.update(friends_params)

    redirect_to friend_path(@friend)
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friends_params
    params.require(:friend).permit(:name, :price, :description, :address, :activity_id, :avatar)
  end

end
