class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def find
    if params[:query].present?
      @restaurants = Restaurant.search_complex(params[:query]).uniq
      @cuisines = Cuisine.search_complex(params[:query]).uniq
      @dishes = Dish.search_complex(params[:query]).uniq
      raise
    end
  end
end
