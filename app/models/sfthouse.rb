class Sfthouse < ApplicationRecord

  include PgSearch::Model
  include Filterable

  pg_search_scope :product_search,
                  against: [:title, :website, :contact ],
                  using: {
                      tsearch: {prefix: true}
                  }

end
