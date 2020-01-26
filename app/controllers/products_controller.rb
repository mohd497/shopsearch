class ProductsController < ApplicationController

  include Products

  def index
    @products = Product.filter(params).paginate(page: params[:page], per_page: 9)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new

  end

  def create
    file = params[:product][:file].read
    products = product_parse(file)
    @products = Product.create(products)
    if @products.each(&:save)
      redirect_to root_path, notice: "Products uploaded successfully."
    else
      render :new, alert: "There was an error that prevented this product from being created."
    end
  end

  def product_params
    params.require(:product).permit(:title,
                                    :description,
                                    :country,
                                    :price,
                                    tags: [:title])
  end
end
