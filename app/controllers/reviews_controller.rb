class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @user = User.find(current_user.id)
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    # @review.cocktail_id = params[:cocktail_id]
    if @review.save
      redirect_to cocktail_path(params[:cocktail_id])
    elsif @review.stars > 5
      redirect_back fallback_location: root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:cocktail_id, :stars, :description, :user_id)
  end
end
