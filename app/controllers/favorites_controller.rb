class FavoriteController < ActionController::Base
  def create
    current_user.favorites.create(:cocktail_id => params[:cocktail_id])
    render :layout => false
  end
end
