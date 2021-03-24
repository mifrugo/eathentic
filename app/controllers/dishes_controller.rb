class DishesController < ApplicationController
  def favorite
    @favorite = FavoriteDish.where(dish: Dish.find(params[:id]), user: current_user).first

    if @favorite.nil?
      @favorite = FavoriteDish.create(dish: Dish.find(params[:id]), user: current_user)
      action = { action: 'added' }
      authorize @favorite
    else
      authorize @favorite
      action = { action: 'removed' }
      @favorite.destroy
    end

    render json: action.to_json
  end
end
