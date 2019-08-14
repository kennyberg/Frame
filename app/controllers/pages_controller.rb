class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    # below, for current cart
    @current_cart = Cart.where(user_id: current_user.id).where(state: "pending")
    @products_in_current_cart = CartProduct.where(cart_id: @current_cart)
    # below, for previous orders
    @previous_carts = Cart.where(user_id: current_user.id).where(state: "paid")
    # still need to do the same for user's uploaded images
    # still need to do the same for user's wishlists
    # still need to do the same for user's information
  end
end
