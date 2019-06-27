class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)

    redirect_back fallback_location: root_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.delete

    redirect_back fallback_location: root_path
  end

  private

  def like_params
    params.permit(:user_id, :review_id, :cocktail_id)
  end
end
