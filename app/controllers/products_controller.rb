class ProductsController < ApplicationController
  before_filter :authorize, except: [:index, :show]


  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items.all
  end

  def show
    @product = Product.find(params[:id])
    redirect_to products_path
  end

  def new
    @product = Product.new
    render :new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to '/'
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
       redirect_to @product, notice: 'Product was successfully updated.'

      else
        render :edit

      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
