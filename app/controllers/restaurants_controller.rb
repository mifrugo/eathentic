class RestaurantsController < ApplicationController
  before_action :set_restaurants, only: [:show]
  def map
  end

  def list
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    
  end

  def edit
  end
  
  private

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end  
end
