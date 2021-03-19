class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def search?
    show?
  end

  def scrape?
    true
  end

  def list?
    true
  end

  def list_per_dish?
    true
  end

  def review?
    user && (user.cuisine_id == record.cuisine_id && Review.where(user_id: user.id, restaurant_id: record.id).empty?)
  end

  def search_list?
    true
  end

  def search_dish?
    true
  end

  def search_location?
    true
  end

  def location_list?
    true
  end
end
