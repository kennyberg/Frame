class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def show
    @cart = Cart.find(params[:cart_id])
    # est-ce que ça me suffit pour importer les éléments du cart et les appeler dans ma show?

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

    if @order.save
      @status = "pending"
      # comment je change le status ici ?
      redirect_to new_cart_order_path(@order.cart_id)
    else
      render "new"
    end
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


