module Filterable
  extend ActiveSupport::Concern

  module ClassMethods

    def filter(params)
      if params["search"]
        min_price = params["search"]["min_price"].empty? ? "0" : params["search"]["min_price"]
        max_price = params["search"]["max_price"].empty? ? "100000" : params["search"]["max_price"]
        sort = sort_result(params["search"]["sort"])
        filter = params["search"]["title"]

        filter.concat(" " + params["search"]["country"]) if params["search"]["country"] != "-1"
        results = filter.present? ? self.order(sort).product_search("#{filter}").where(price: (min_price .. max_price)) : self.order(sort).where(price: (min_price .. max_price))
      else
        results = self.all
      end
      results
    end

    def sort_result(params)
      case params
      when "relevance"
        nil
      when "Added old to new"
        "created_at DESC"
      when "Added new to old"
        "created_at ASC"
      when "Price low to high"
        "price ASC"
      when "Price high to low"
        "price DESC"
      end
    end

  end
end