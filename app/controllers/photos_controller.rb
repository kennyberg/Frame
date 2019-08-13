class PhotosController < ApplicationController
  def index
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.api_url = "https://res.cloudinary.com/kbframe/#{@photo.upload.identifier}"
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :upload, :user_id, :api_url)
  end
end
