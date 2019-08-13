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
    params.require(:photo).permit(:title, :uploaded_url)
  end
end
