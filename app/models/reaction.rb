class Reaction < ApplicationRecord
  belongs_to :review
  belongs_to :user

  validates :number, presence: true, inclusion: { in: [ -2, -1, 1, 2 ] }
  after_commit :compute_review

  ICONS = {
    '2': 'hearts.svg',
    '-1': 'thumbdown.svg',
    '1': 'thumbup.svg',
    '-2': 'mad.svg'
  }

  def compute_review
    review.compute
  end
end
