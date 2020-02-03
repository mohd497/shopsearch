module Filterable
  extend ActiveSupport::Concern

  module ClassMethods

    def filter(params)
      if params["search"]
        sort = sort_result(params["search"]["sort"])
        filter = params["search"]["title"]

        results = filter.present? ? self.order(sort).product_search("#{filter}") : self.order(sort)
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
      end
    end

  end
end