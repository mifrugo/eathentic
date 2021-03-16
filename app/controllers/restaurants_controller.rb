class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  def map
  end

  def list
    @restaurants = Restaurant.all
    authorize @restaurants
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
end
