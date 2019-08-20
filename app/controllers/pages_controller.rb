class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    # below, for current user favorites
    @favorites = current_user.favorites
    # below, for user's uploaded images section
    @uploaded_photos = Photo.where(user_id: current_user.id)
    # below, for previous orders section
    @previous_carts = Cart.where(user_id: current_user.id).where(state: "paid")
    # below, for user previous orders
    @orders = Cart.where(user: @user)
    # below, for user information
    @user = current_user
  end
end
