class Ingredient < ApplicationRecord
  belongs_to :user

  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  has_one_attached :photo
end
