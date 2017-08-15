class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  def new
    @booking = @friend.bookings.build
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def delete
  end

  def update
  end

  def create
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
