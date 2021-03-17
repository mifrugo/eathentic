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

  def review?
    user.cuisine_id == record.cuisine_id && Review.where(user_id: user.id, restaurant_id: record.id).empty?
  end  
end
