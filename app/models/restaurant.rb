class Restaurant < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  belongs_to :location

  belongs_to :cuisine

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :menus, dependent: :destroy
  has_many :menu_dishes, through: :menus
  has_many :dishes, through: :menu_dishes
  has_many :reviews, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :reviewers, through: :reviews, source: :user
  has_many_attached :photos

  pg_search_scope :search_complex,
                  against: %i[name description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
