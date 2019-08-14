class ProductsController < ApplicationController
  def create
    raise
    @product = Product.new(product_params)
    @photo = Photo.find(params[:id])
    # @frame_combo = FrameCombo.where(frame_material: params[])
    @product.photo = @photo
    @product.frame_combo = @frame_combo
    if product.save
      redirect_to user_dashboard_path
    else
      redirect_to photo_path(@photo)
    end
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:photo_id, :frame_combo_id)
  end
end
