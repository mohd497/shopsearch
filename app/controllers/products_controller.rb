class ProductsController < ApplicationController

  include Products
  http_basic_authenticate_with name: "secret", password: "secret", except: [:index, :create]

  def index
    @products = Sfthouse.filter(params).paginate(page: params[:page], per_page: 9)
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
    products = eval(file)[:pklist]
    products.each do |product|
      @product = Sfthouse.create(title: product[:title], website: product[:website], contact: product[:contact])
      @product.save
    end

    redirect_to root_path, notice: "Products uploaded successfully."
  end

  def product_params
    params.require(:product).permit(:title,
                                    :description,
                                    :country,
                                    :price,
                                    tags: [:title])
  end
end
