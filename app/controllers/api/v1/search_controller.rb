module Api
  module V1
    class SearchController < Api::V1::BaseController
      include ActionController::Cookies
      before_action :geolocalize
      before_action :set_restaurants

      def index
        @restaurants = policy_scope(@restaurants.search_complex(params[:q]))
        @cuisines = Cuisine.search_complex(params[:q])
        @dishes = Dish.search_complex(params[:q])
      end

      private

      def set_restaurants
        @restaurants = Restaurant.near([@latitude, @longitude], 15)
        authorize @restaurants
      end

      def geolocalize
        @latitude = cookies[:latitude] || 41.89306
        @longitude = cookies[:longitude] || 12.48278
      end
    end
  end
end
