class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    user = User.find(params[:id])
    @favorites = Favorite.where(user_id: user.id)
    @gifs = @favorites.map do |favorite|
      Gif.find_by("id = #{favorite.gif_id}")
    end
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = 'Username already exists'
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
