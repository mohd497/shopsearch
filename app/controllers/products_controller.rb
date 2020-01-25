class ProductsController < ApplicationController
  def index
    if params["search"]
      @filter = params["search"]["title"]
      @products = Product.all.product_search("#{@filter}")
    else
      @products = Product.all
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new

  end

  def create
    file = params[:product][:file].read
    products = JSON.parse(file)
    products.each do |product|
      tags = product["tags"].split(',') if product["tags"]
      tags = tags.map{ |tag| Tag.new(title: tag) }
      product["tags"] = tags
    end

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
