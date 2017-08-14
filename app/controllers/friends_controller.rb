class FriendsController < ApplicationController

  before_action :set_friend, only: [:show, :update, :destroy]
  def index
    @friends = Friend.all
  end

  def show

  end

  def new
    @friend = Friend.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

end
