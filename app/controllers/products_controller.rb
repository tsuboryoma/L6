class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = '1レコード追加しました'
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:notice] = '1レコード削除しました'
    redirect_to products_path
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
