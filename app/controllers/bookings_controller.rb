class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]
  before_action :init_friend, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def show
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    redirect_to friend_path(booking.friend)
  end

  def update
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.friend = @friend
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def init_friend
    @friend = Friend.find(params[:friend_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :date)
     #:start_date, :end_date to be added
  end
end
