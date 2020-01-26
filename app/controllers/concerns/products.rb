module Products
  extend ActiveSupport::Concern

    def product_parse(file)
      products = JSON.parse(file)
      products.each do |product|
        tags = product["tags"].split(',') if product["tags"]
        tags = tags.map{ |tag| Tag.new(title: tag) }
        product["tags"] = tags
      end

      products
    end
end