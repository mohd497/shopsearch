module Products
  extend ActiveSupport::Concern

    def product_parse(file)
      products = JSON.parse(file)
    end
end