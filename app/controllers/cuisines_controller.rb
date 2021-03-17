class CuisinesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :single_cuisine, only: %i[show search]

  def index
    @cuisines = policy_scope(Cuisine).order(created_at: :desc)
  end

  def show
    @dishes = @cuisine.dishes
  end

  def search
    @dishes = params[:query].present? ? @cuisine.dishes.search_complex(params[:query]) : @cuisine.dishes
    render :show
  end

  private

  def single_cuisine
    @cuisine = Cuisine.find(params[:id])
    authorize @cuisine
  end
end
