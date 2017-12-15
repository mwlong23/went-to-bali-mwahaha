class ProductsController < ApplicationController
  before_filter :authorize, except: [:index, :show]


  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items.all
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html { redirect_to redirect_to products_path }
      format.js
    end
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to '/'
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
