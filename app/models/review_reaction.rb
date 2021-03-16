class ReviewReaction < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :reaction
end
