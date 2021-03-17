class CuisinesController < ApplicationController
  def index
    @cuisines = policy_scope(Cuisine).order(created_at: :desc)
  end

  def show
    @cuisine = Cuisine.find(params[:id])
    authorize @cuisine
  end

  def search
    @cuisine = Cuisine.find(params[:id])
    authorize @cuisine

    render :show
  end

end
