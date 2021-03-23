class Reaction < ApplicationRecord
  belongs_to :review
  belongs_to :user

  validates :number, presence: true, inclusion: { in: [ -2, -1, 1, 2 ] }
  after_commit :compute_review

  def compute_review
    self.review.compute
  end
end
