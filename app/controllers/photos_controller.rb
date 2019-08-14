class PhotosController < ApplicationController
  def index
    @photos = Photo.where(cl_url: nil) # we don't display the photos uploaded by the user on the index page
  end

  def show
    @photo = Photo.find(params[:id])
    # @frame_material =
    # @frame_combo = FrameCombo.where(frame_material: @frame_material).where(frame_dimension: @frame_dimension)
    # @product = Product.new(photo_id: @photo.id, frame_combo: @frame_combo)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.cl_url = "https://res.cloudinary.com/kbframe/#{@photo.upload.identifier}"
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def destroy
    @photo.destroy
    redirect_to user_dashboard_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :upload, :user_id, :cl_url)
  end
end
