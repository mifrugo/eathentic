class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    user.cuisine_id == record.restaurant.cuisine_id
  end
end
