class DishRequest < ApplicationRecord
  belongs_to :dish
  belongs_to :user
end
