class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :rating, presence: true, inclusion: { in: (1..5)}
  has_one_attached :photo
  validates :user_id, uniqueness: { scope: :restaurant_id }
end
