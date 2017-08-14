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
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'Bienvenue sur la location de potes ! :)'
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
