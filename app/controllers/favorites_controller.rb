class FavoritesController < ApplicationController
  def create
      if Photo.where(api_id: params[:api_id]).first
        @photo = Photo.where(api_id: params[:api_id]).first
      else
        @photo = Photo.new
        @photo.api_id = params[:api_id]
        @photo.api_url = params[:url_id]
        @photo.save
      end
   @favorite = Favorite.new(photo_id: @photo.id, user_id: current_user.id)
   @favorite.save if Favorite.where(photo_id: @photo.id, user_id: current_user.id).empty?
   respond_to do |format|
     format.js
   end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to user_dashboard_path
  end
end
