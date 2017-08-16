class FriendsController < ApplicationController

  before_action :set_friend, only: [:show, :update, :destroy]
  def index
    if params["search"] != nil
      city = params["search"]["city"]
      city.upcase if !city.blank?
      activity_id = params["search"]["activity_id"]
      if city.blank? || activity_id.blank?
        @friends = Friend.all
      else
        @friends = Friend.where(activity_id: activity_id)#(city: city, activity_id: activity_id)
      end
    else
      @friends = Friend.all
    end
  end

  def show
    @review = Review.new
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
    params.require(:friend).permit(:name, :price, :description, :address, :activity_id, :avatar, pictures: [])
  end

end
