class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :reactions, dependent: :destroy

  validates :rating, presence: true, inclusion: { in: (1..5)}
  has_one_attached :photo
  validates :user_id, uniqueness: { scope: :restaurant_id }

  def compute
    counter = self.reactions.sum { |reaction| reaction.number }
    self.update(counter: counter)
  end  
end
