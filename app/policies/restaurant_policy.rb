class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def list?
    true
  end

  def list_per_dish?
    true
  end
end
