class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]
  def show

  end

  def new
  end

  def update
  end

  def create
  end

  def delete
  end

  private

  def set_cocktail
    @friend = Friend.find(params[:id])
  end

end
