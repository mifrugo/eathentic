class DishRequest < ApplicationRecord
  belongs_to :dish
  belongs_to :user

  has_one_attached :photo
end
