class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all

    @markers = Cocktail.where.not(latitude: nil, longitude: nil).map do |c|
      {
        lat: c.latitude,
        lng: c.longitude
      }
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :description, :location)
  end
end
