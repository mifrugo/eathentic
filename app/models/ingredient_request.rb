class IngredientRequest < ApplicationRecord
  belongs_to :ingredient
  belongs_to :user

  has_one_attached :photo
end
