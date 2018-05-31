class FavoritesController < ApplicationController

  def create
    Favorite.create(gif_id: params[:gif], user_id: params[:user_id])
    redirect_to gifs_path
  end

  def destroy
    user = User.find(params[:id])
    Favorite.delete(params[:id])
    redirect_to user_path(user)
  end
end
# strong params
# as a user, can i have 5 of the same gifs,
# when i look at that users favorites, does
#   that gif id alread exist
