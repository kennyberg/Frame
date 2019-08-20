class CartsController < ApplicationController
  def show

    @cart = Cart.find(params[:id])
    @cart_products = @cart.cart_products

    product_ids = []
      @cart_products.each do |cart_product|
      product_ids << cart_product.product_id
    end
    # là je récupère les ids de TOUS les produits contenu dans 1 caddie

    @products = []
    prices = []
    product_ids.each do |id|
      product = Product.find(id)
      prices << product.price
      @products << product
    end

    @quantity = @products.length
    @total_price = prices.inject(0){|sum,x| sum + x }
  end

end
