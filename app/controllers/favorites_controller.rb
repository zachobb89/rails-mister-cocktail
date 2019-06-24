class FavoritesController < ActionController::Base
  def create
    @favorite = Favorite.create(favorite_params)
    redirect_back fallback_location: root_path
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.delete

    redirect_back fallback_location: root_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :cocktail_id)
  end
end
