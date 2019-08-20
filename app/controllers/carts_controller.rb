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
    # là j'appelle, pour chaque id, l'instance produit.
    # Dans ce produit, je vais pouvoir trouver le photo.id et le frame_combo.id.
    # DU coup je vais pouvoir accéder aux infos de la table photos et du frame_combo.

    @quantity = @products.length
    @total_price = prices.inject(0){|sum,x| sum + x }
  end


# Pour chaque cart_product
  # 1. je dois récupérer les cart products
  # 2. je dois en tirer le material et le dimension
  # 3. Je dois récupérer le prix du combo
  # 4. je dois récupérer l'image de la photo et le titre


  # question: qui gère la fonction delete un cart_product?

# Ensuite, pour faire mon total_cart:
# 1. Je dois compter le nombre de cart_product
# 2. Je dois additionner les prix


end
