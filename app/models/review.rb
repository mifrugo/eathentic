class Review < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :restaurant
  belongs_to :user
  has_many :reactions, dependent: :destroy

  validates :rating, presence: true, inclusion: { in: (1..5)}
  has_one_attached :photo
  validates :user_id, uniqueness: { scope: :restaurant_id }

  def compute
    counter = reactions.sum(&:number)
    update(counter: counter)
  end
end
