class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cocktails = Cocktail.where(user: @user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end
end
