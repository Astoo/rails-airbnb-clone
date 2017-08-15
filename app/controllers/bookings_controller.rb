class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  def show
  end

  def delete
  end

  def update
  end

  def create
  end

  def new
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
