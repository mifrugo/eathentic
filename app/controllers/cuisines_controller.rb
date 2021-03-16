class CuisinesController < ApplicationController
  def index
    @cuisines = policy_scope(Cuisine).order(created_at: :desc)
  end

  def show
    @cuisine = Cuisine.find(params[:id])
    @restaurants = Restaurant.where(cuisine_id:  @cuisine.id)
    authorize @cuisine
  end

end
