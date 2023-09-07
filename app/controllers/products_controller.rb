# frozen_string_literal: true

# Controller for products
class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product saved successfully!'
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @product.update
      flash[:notice] = 'Product updated successfully!'
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    flash[:alert] = 'Product deleted successfully'
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
