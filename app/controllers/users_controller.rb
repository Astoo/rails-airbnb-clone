class UsersController < ApplicationController

  def show
    @users = User.all
  end

  def update
  end

  def new
    @user = User.new
  end


  def create

  end

  def delete
  end

end
