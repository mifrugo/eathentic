class Dish < ApplicationRecord
  include PgSearch::Model

  belongs_to :user

  has_many :menu_dishes
  has_many :menus, through: :menu_dishes

  has_many_attached :photos

  pg_search_scope :search_complex,
                  against: %i[name description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
