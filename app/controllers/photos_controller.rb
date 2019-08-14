class PhotosController < ApplicationController
  def index
    @photos = Photo.where(cl_url: nil) # we don't display the photos uploaded by the user on the index page
  end

  def show
    @photo = Photo.find(params[:id])
    @product = Product.new
    # below, we retrieve the dimensions and materials available to display them in dropdown menus
    @frame_dimensions = FrameDimension.all
    @frame_materials = FrameMaterial.all

    # below, we create an array with a lot of hashes containing the information of every combo
    # we do that so that we can translate those information as a json file
    # we will then parse that json file into a javascript file so that we can use javascript on these information
    # and so that we can add addEventListener on the dropdown menus
    @prices = FrameCombo.all.map do |combo|
      {
        material: combo.frame_material_id,
        dimension: combo.frame_dimension_id,
        price: combo.price.fractional/100
      }
    end
  end

  def new
    # below, is only to allow the user to upload his own photos
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    # below, we make sure that the photo uploaded by the user only belongs to him and not the other users
    @photo.user_id = current_user.id
    # below, allows us to get the cloudinary link of the photo
    @photo.cl_url = "https://res.cloudinary.com/kbframe/#{@photo.upload.identifier}"
    if @photo.save
      redirect_to photo_path(@photo.id)
    else
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.upload.file.delete
    @photo.destroy
    redirect_to user_dashboard_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :upload, :user_id, :cl_url)
  end
end
