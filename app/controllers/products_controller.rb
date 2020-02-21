class ProductsController < ApplicationController

  include Products
  http_basic_authenticate_with name: "secret", password: "secret", except: [:index, :create, :all_software]

  def index
    @products = Sfthouse.filter(params).paginate(page: params[:page], per_page: 9)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def all_software
    #@softs = Sfthouse.select('stfhouses.id,stfhouses.title, AVG(reviews.rating)').joins(:reviews).group('sfthouses.id').references(:reviews)
    sql = "SELECT v1.id,v1.title,v1.website,v1.contact,AVG(v2.rating) FROM sfthouses AS v1 LEFT JOIN reviews AS v2 ON v1.id = v2.sfthouse_id  AND v2.accepted = true GROUP BY v1.id ORDER BY v1.id;"
    records_array = ActiveRecord::Base.connection.execute(sql)
    render json: records_array
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
