class AccountsController < ApplicationController
  before_action :set_account_id

  def show
  end


  private

  def set_account_id
    @account_id = current_user
  end
end
