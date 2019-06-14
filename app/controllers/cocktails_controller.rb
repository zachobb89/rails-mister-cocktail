class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail: @cocktail)
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
    @cocktail.delete
    redirect_to root_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
