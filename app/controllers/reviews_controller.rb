class ReviewsController < ApplicationController
  before_action :set_review, only: [:new, :create]

  def new
    @review = Review.new
  end
  #take care of rending the new and create methods accessible only if a user is logged in.

  def create
    @review = Review.new(review_params)
    @review.user = current_user
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

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
