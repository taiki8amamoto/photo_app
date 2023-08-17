class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites.all
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to favorites_path, notice: "#{favorite.picture.user.name}さんの投稿をお気に入りに登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to favorites_path, notice: "#{favorite.picture.user.name}さんの投稿をお気に入りから解除しました"
  end
end
