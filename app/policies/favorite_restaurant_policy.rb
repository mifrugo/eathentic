class FavoriteRestaurantPolicy < ApplicationPolicy
  def create?
    true
  end

  def favorite?
    user
  end
end
