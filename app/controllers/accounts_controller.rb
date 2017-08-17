class AccountsController < ApplicationController
  before_action :set_account_id

  def show
    if user_signed_in?
      @my_bookings = Booking.where(user_id: current_user.id)
      @others_bookings = Booking.joins(:friend).where(user_id: current_user)
    end
  end


  private

  def set_account_id
    @account_id = current_user
  end
end


#Client.joins(:orders).where(orders: { created_at: time_range })
