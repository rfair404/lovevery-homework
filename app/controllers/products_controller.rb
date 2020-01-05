class ProductsController < ApplicationController
  def index
    @products = Product.all.order(:age_low_weeks)
  end

  def show
    @product = Product.find(params[:id])
  end
end
