class Api::ProductsController < ApplicationController
  before_action :find_product, only: [:show, :destroy]

  def index
    @products = []
    Product.all.each do |product|
      @products.push(product)
    end
    render json: { product: @products }
  end

  def show
    render json: { product: @product }
  end

  def create
    @product = Product.create(product_params)
    render json: {product: @product}, status: 201
  end

  def destroy
    render json: {product: @product.destroy}
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:description, :value)
  end
end
