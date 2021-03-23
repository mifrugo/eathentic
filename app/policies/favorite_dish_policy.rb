class FavoriteDishPolicy < ApplicationPolicy
  def favorite?
    user
  end
end
