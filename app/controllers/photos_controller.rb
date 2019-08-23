class PhotosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :create]

  def index
    if params[:query] && params[:query] != ""
      @query = params[:query]
      url = "https://api.pexels.com/v1/search?query=#{@query}+query&per_page=12"
      @json_results = RestClient.get(url, headers = { Authorization: ENV['PEXELS_API_KEY'] })
      @results = JSON.parse(@json_results)
      @max_page = @results["total_results"] / @results["per_page"]
      @photos = @results["photos"]
        if @results["next_page"]
          @next_query = @results["next_page"].split("?").last
        end
    else
      url = "https://api.pexels.com/v1/search?query=art+query&per_page=12"
      @json_results = RestClient.get(url, headers = { Authorization: ENV['PEXELS_API_KEY'] })
      @results = JSON.parse(@json_results)
      @photos = @results["photos"]
      if @results["next_page"]
        @next_query = @results["next_page"].split("?").last
      end
    end
  end

  def upload
    url = "https://api.pexels.com/v1/search/?#{params[:query]}"
    @json_results = RestClient.get(url, headers = { Authorization: ENV['PEXELS_API_KEY'] })
    @results = JSON.parse(@json_results)
    @photos = @results["photos"]
    @next_query = @results["next_page"].split("?").last
    respond_to do |format|
      format.js
    end
  end

  def show
    @photo = Photo.find(params[:id])
      if @photo.api_id
        url = "https://api.pexels.com/v1/photos/#{@photo.api_id}"
        @json_results = RestClient.get(url, headers = { Authorization: ENV['PEXELS_API_KEY'] })
        @photo_api = JSON.parse(@json_results)
      end
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
        price: combo.price.fractional / 100
      }
    end
  end

  def new
    # below, is only to allow the user to upload his own photos
    @photo = Photo.new
  end

  def create
    if params["photo"]["api_id"]
      if Photo.where(api_id: params["photo"]["api_id"]).first
        @photo = Photo.where(api_id: params["photo"]["api_id"]).first
        redirect_to photo_path(@photo.id)
      else
        @photo = Photo.new
        @photo.api_id = params["photo"]["api_id"]
        @photo.api_url = params["photo"]["api_url"]
        @photo.height = params["photo"]["height"]
        @photo.width = params["photo"]["width"]

        height = @photo.height.to_f
        width = @photo.width.to_f
        result = height / width
        if result < 0.80 && result > 0.70
          result = 0.75
        elsif result > 1.40 && result < 1.60
          result = 1.5
        else
          result = result
        end

        if result == 0.75
          @photo.description = "portrait"
        elsif result == 1.5
          @photo.description = "landscape"
        else
          @photo.description = "not defined yet"
        end

        @photo.save
        redirect_to photo_path(@photo.id)
      end
    else
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
  end

  def destroy
    @photo = Photo.find(params[:id])
    @products = Product.where(photo_id: @photo.id)
    @current_cart = Cart.where(user_id: current_user.id).where(state: "pending").first
    if @products
      @products.each do |product|
        @cart_products_array = []
        @one_cart_product = CartProduct.where(cart: @current_cart).where(product_id: product.id).first
        @cart_products_array << @one_cart_product
      end

      if @cart_products_array
        @cart_products_array.each do |cart_product|
          cart_product.destroy
        end
      end
    end

    if @products
      @products.destroy_all
    end

    @photo.upload.file.delete
    @photo.destroy
    redirect_to user_dashboard_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :upload, :user_id, :cl_url)
  end
end


