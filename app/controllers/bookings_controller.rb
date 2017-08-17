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
    redirect_to account_path(current_user)
  end

  def update
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.start_date = Date.new(booking_params["start_date(1i)"].to_i, booking_params["start_date(2i)"].to_i, booking_params["start_date(3i)"].to_i)
    @booking.end_date = Date.new(booking_params["end_date(1i)"].to_i, booking_params["end_date(2i)"].to_i, booking_params["end_date(3i)"].to_i)
    @booking.user = current_user
    @booking.friend = @friend
    @booking.status = "pending"
    if @booking.start_date < @booking.end_date
      @booking.save
    end
    redirect_to friend_path(@friend)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def init_friend
    @friend = Friend.find(params[:friend_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :date, :start_date, :end_date)
  end
end
