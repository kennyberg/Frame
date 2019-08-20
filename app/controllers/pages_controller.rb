class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @favorites = current_user.favorites
    # below, for current cart section
    # below, for user's uploaded images section
    @uploaded_photos = Photo.where(user_id: current_user.id)
    # below, for previous orders section
    @previous_carts = Cart.where(user_id: current_user.id).where(state: "paid")
    # still need to do the same for user's favorites
    # still need to do the same for user's information

  end
end
