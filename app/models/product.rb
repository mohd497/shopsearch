class Product < ApplicationRecord
  has_many :product_tags
  has_many :tags, through: :product_tags

  include PgSearch::Model
  include Filterable

  pg_search_scope :product_search,
                  against: [:title, :description, :country ],
                  associated_against: {
                      tags: [:title]
                  },
                  using: {
                      tsearch: {prefix: true}
                  }
end
