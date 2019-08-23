class ProductsController < ApplicationController
  def create
    # below, we call a method that is on located at the bottom of this file
    create_product_and_cart_product
  end

  def destroy
    # below, we find the product
    @product = Product.find(params[:id])
    # below, we locate the current cart of the user by looking for the cart with a pending state
    @current_cart = Cart.where(user_id: current_user.id).where(state: "pending").first
    # then, we find the cart_product that has the product that we want and belonging to the right cart
    if CartProduct.where(product_id: @product.id).where(cart_id: @current_cart.id).first
      @product_in_current_cart_products = CartProduct.where(product_id: @product.id).where(cart_id: @current_cart.id).first
    # finally, we destroy the product from the user's cart
      @product_in_current_cart_products.destroy
    end
    redirect_to cart_path(current_user.carts.last)
    # @products_in_current_cart = CartProduct.where(cart_id: @current_cart.id)
  end

  def edit
    # below, we do exactly the same as what we have done in photo#show controller
    @product = Product.find(params[:id])
    @photo = Photo.find(@product.photo_id)
    @frame_materials = FrameMaterial.all


    @frame_dimension = FrameDimension.where(orientation: @photo.description)

    @prices = FrameCombo.all.map do |combo|
      {
        material: combo.frame_material_id,
        dimension: combo.frame_dimension_id,
        price: combo.price.fractional/100
      }
    end
  end

  def update
    # below, we do exactly the same as what we have done in photo#create controller but with update
    @product = Product.find(params[:id])
    @frame_combo = FrameCombo.where(frame_material_id: params[:frame][:material]).where(frame_dimension_id: params[:frame][:dimension]).first
    @product.frame_combo_id = @frame_combo.id
    @product.price = @frame_combo.price
    @product.save
    redirect_to cart_path(current_user.carts.last)
  end

  private

  def product_params
    params.require(:product).permit(:photo_id, :frame_combo_id)
  end

  def create_product_and_cart_product
    # below, we initiate the creation of a new product so that we can use it in the photo#show view
    @product = Product.new
    # we find the photo that has been chosen by the user
    @photo = Photo.find(params[:photo_id])
    # we find the combo that has been chosen by the user
    @frame_combo = FrameCombo.where(frame_material_id: params[:frame][:material]).where(frame_dimension_id: params[:frame][:dimension]).first
    # we assign the photo & frame_combo chosen by the user to the product (a product is composed of a photo + a frame_combo)
    @product.photo = @photo
    @product.price = @frame_combo.price
    @product.frame_combo = @frame_combo
    if @product.save
      # we make sure that if a cart with a pending state currently exists, the user put that product in that cart
      # if there's no cart with a pending state, we create a new cart
      @current_cart = Cart.where(user_id: current_user.id).where(state: "pending").first_or_create
      CartProduct.create!(product_id: @product.id, cart_id: @current_cart.id)
      redirect_to cart_path(@current_cart)
    else
      redirect_to photo_path(params[:photo_id])
    end
  end
end
