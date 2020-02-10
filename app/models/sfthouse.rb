class Sfthouse < ApplicationRecord

  has_many :reviews

  include PgSearch::Model
  include Filterable

  pg_search_scope :product_search,
                  against: [:title, :website, :contact ],
                  using: {
                      tsearch: {prefix: true}
                  }

end
