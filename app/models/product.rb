class Product < ApplicationRecord
  has_many :product_tags
  has_many :tags, through: :product_tags

  include PgSearch::Model

  pg_search_scope :product_search,
                  against: [:title, :description, :country, :price ],
                  associated_against: {
                      tags: [:title]
                  },
                  using: {
                      tsearch: {any_word: true}
                  }
end
