class AccountsController < ApplicationController
  before_action :set_account_id

  def show
    if user_signed_in?
      @my_friends = Friend.where(user: current_user)
      @my_bookings = Booking.where(user: current_user)
      friends = Friend.where(user: current_user)
      @others_bookings = Booking.where(friend: current_user)
      # friends.each do |friend|
      #   @others_bookings << Booking.where(friend_id: friend.id)
      # end
      #Booking.where(user_id: current_user)
    end
  end

  private

  def set_account_id
    @account_id = current_user
  end
end
