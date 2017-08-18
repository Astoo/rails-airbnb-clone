class AccountsController < ApplicationController
  before_action :set_account_id

  def show
    if user_signed_in?
      @my_friends = Friend.where(user: current_user)
      @my_bookings = Booking.where(user: current_user)
      @others_bookings = Booking.joins(:friend).where(friends: { user_id: current_user.id })
    end
  end

  private

  def set_account_id
    @account_id = current_user
  end
end
