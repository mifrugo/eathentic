class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :location


  has_many :menus
  has_many :menu_dishes, through: :menus
  has_many :reviews
  has_many :views
  has_many_attached :photos
end
