class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params["search"] != nil
      lat = params[:lat]
      lng = params[:lng]
      if lat.blank? || lng.blank?
        @friends = Friend.where.not(latitude: nil, longitude: nil)
      else
        @friends = Friend.near([lat, lng], 20)
      end
      @hash = Gmaps4rails.build_markers(@friends) do |friend, marker|
        marker.lat friend.latitude
        marker.lng friend.longitude
        marker.infowindow render_to_string(partial: "/friends/map_box", locals: { friend: friend })
      end
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
    @friend = Friend.find(params[:id])
    @friend_coordinates = { lat: @friend.latitude, lng: @friend.longitude }
    @review = Review.new
    @booking = Booking.new
    if user_signed_in?
      @bookings = Booking.where(user_id: current_user.id)
    end
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
