class FavoritesController < ApplicationController
  def create
    Favorite.create(gif_id: params[:gif], user_id: params[:user_id])
  end
end
# strong params
# as a user, can i have 5 of the same gifs,
# when i look at that users favorites, does
#   that gif id alread exist
