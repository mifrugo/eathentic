class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :location

  belongs_to :cuisine

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :menus
  has_many :menu_dishes, through: :menus
  has_many :dishes, through: :menu_dishes
  has_many :reviews
  has_many :views
  has_many :reviewers, through: :reviews, source: :user
  has_many_attached :photos
end
