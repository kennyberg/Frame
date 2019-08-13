class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]

  def show
  end

  def new
    @order = Order.new
    @cart = Cart.find(params[:cart_id])
    # (maybe params[:id], à voir quand on testera)
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.cart_id = params[:cart_id]

    # @order.save() to do > payment
    if

    end

  end

  def edit
  end

  def update
    @order.update(order_params)
    redirect_to photos_path
  end

  private

  def order_params
    params.require(:order).permit(:address_line_1, :address_zipcode, :address_city, :country, :phone_number)
    # here i only allow the update of the delivery fields
  end

  def set_order
    @order = Order.find(params[:id])
  end
end


