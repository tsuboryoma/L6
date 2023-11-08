class CartItemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
  end

  def create
    product = Product.find(params[:product_id])
    quantity = params[:qty].to_i  # 数値に変換する
    @cart_item = current_cart.add_product(product.id, quantity)
    current_cart.save
    if @cart_item.save
      redirect_to cart_path(current_cart), notice: 'カートに商品を追加しました。'
    else
      redirect_to products_path, alert: '商品の追加に失敗しました。'
    end
  end

  def destroy
    @cart_item = current_cart.cart_items.find_by(id: params[:id])
    @cart_item.destroy
    message = 'カートから商品を削除しました'
    redirect_to cart_path(current_cart), notice: message
  end
end
