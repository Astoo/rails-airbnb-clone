class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
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
