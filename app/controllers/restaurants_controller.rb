class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_restaurant, only: %i[show]
  before_action :geolocalize, only: %i[list map list_per_dish search_list search_dish]
  before_action :set_restaurants, only: %i[list map search_list]
  before_action :restaurants_per_dish, only: %i[list_per_dish search_dish]
  before_action :restaurants_search, only: %i[search_list search_dish]

  def map; end

  def list
    @path = restaurant_search_path
  end

  def list_per_dish
    @path = restaurant_dish_search_path
        @restaurants= @restaurants.uniq

    render :list
  end

  def show
    @review = Review.new
  end

  def search_list
    @path = restaurant_search_path
    @restaurants= @restaurants.uniq
    render :list
  end

  def search_dish
    @path = restaurant_dish_search_path
    @restaurants= @restaurants.uniq
    render :list
  end

  def new; end

  def edit; end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def set_restaurants
    @restaurants = Restaurant.near([@latitude, @longitude], 15)
    authorize @restaurants
  end

  def restaurants_per_dish
    @restaurants =  Restaurant
                    .joins(:menus)
                    .joins(:menu_dishes)
                    .near([@latitude, @longitude], 15)
                    .where('menu_dishes.dish_id=?', params[:id])
    authorize @restaurants
  end

  def restaurants_search
    @restaurants = @restaurants.search_complex(params[:query]) if params[:query].present?
  end

  def geolocalize
    @latitude = cookies[:latitude].to_f || 41.89306
    @longitude = cookies[:longitude].to_f || 12.48278
  end
end
