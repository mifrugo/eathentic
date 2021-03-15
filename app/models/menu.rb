class Menu < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  has_many :menu_dishes
  has_many :dishes, through: :menu_dishes
end
