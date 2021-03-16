class CuisinesController < ApplicationController
  before_action :set_restaurants, only: [:show]
  def index
    @cuisines = policy_scope(Cuisine).order(created_at: :desc)
  end

  def show
    raise
    @cuisine = Cuisine.find(params[:id])
    authorize @cuisine

  end

  private

  def set_restaurants
   # @restaurants = Restaurant.where(cuisine_id: @cuisine.id)
  end  
end
