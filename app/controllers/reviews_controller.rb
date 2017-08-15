class ReviewsController < ApplicationController
  before_action :set_review, only: [:new, :create]

  def show
  end

  def new
  end

  def create
    @review = Review.new(review_params)
    @review.friend = @friend
    if @review.save
      redirect_to friend_path(@friend)
    else
      render :new
    end
  end

  private

  def set_review
    @friend = Friend.find(params[:friend_id])
  end
end
