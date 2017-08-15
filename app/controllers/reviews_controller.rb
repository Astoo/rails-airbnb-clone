class ReviewsController < ApplicationController
  before_action :set_review, only: [:new, :create]

  def show
  end

  def new
  end

  def create
  end

  def delete
  end

  private

  def set_review
    @friend = Friend.find(params[:friend_id])
  end
end
