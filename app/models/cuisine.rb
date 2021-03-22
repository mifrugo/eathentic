class Cuisine < ApplicationRecord
  include PgSearch::Model

  has_many :restaurants
  has_many :dishes, through: :restaurants

  pg_search_scope :search_complex,
                  against: %i[name],
                  using: {
                    tsearch: { prefix: true }
                  }
end
