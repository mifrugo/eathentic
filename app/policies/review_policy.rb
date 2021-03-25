class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.cuisine_id == record.restaurant.cuisine_id && Review.where(user_id: user.id, restaurant_id: record.restaurant.id).empty?
  end

  def react?
    record.user_id != user.id && Reaction.where(user_id: user.id, review_id: record.id).empty?
  end
end
