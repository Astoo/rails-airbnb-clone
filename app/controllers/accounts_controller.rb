class AccountsController < ApplicationController
  before_action :set_account_id

  def show
    if user_signed_in?
      @my_bookings = Booking.where(user_id: current_user.id)
      friends = Friend.where(user_id: current_user.id)
      @others_bookings = []
      friends.each do |friend|
        @others_bookings << Booking.where(friend_id: friend.id)
      end
      #Booking.where(user_id: current_user)
    end
  end

  private

  def set_account_id
    @account_id = current_user
  end
end
