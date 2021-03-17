class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  before_action :geolocalize, only: %i[list map list_per_dish]
  before_action :set_restaurants, only: %i[list map list_per_dish]

  def map
  end

  def list; end

  def list_per_dish
    @restaurants = @restaurants.select do |rest|
      rest.dish_ids.include? params[:id].to_i
    end

    render :list
  end

  def show
    @review = Review.new
  end

  def new
  end

  def edit
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def set_restaurants
    @restaurants = Restaurant.near([@latitude, @longitude], 15)
    authorize @restaurants
  end

  def geolocalize
    @latitude = cookies[:latitude].to_f || 41.89306
    @longitude = cookies[:longitude].to_f || 12.48278
  end
end
