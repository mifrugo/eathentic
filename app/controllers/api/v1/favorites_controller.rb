class Api::V1::FavoritesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def create
    @favorite = FavoriteRestaurant.where(restaurant: Restaurant.find(params[:restaurant]), user: current_user).first

    if @favorite.nil?
      #create favorite
       @favorite = FavoriteRestaurant.create(restaurant: Restaurant.find(params[:restaurant]), user: current_user)
       authorize @favorite
       head :no_content, status: :created

    else
      #delete the favorite
      authorize @favorite
      @favorite.destroy
    end
  end
end
