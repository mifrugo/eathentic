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
    user.cuisine_id == record.cuisine_id 
  end  
end
