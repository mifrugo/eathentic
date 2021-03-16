class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :rating, :inclusion => 1..5
  has_one_attached :photo
end
