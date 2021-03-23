module Api
  module V1
    class RestaurantsController < Api::V1::BaseController
      before_action :geolocalize
      before_action :set_restaurants

      def show; end

      private

      def geolocalize
        @latitude = params[:latitude]
        @longitude = params[:longitude]
      end

      def set_restaurants
        @restaurants = Restaurant.near([@latitude, @longitude], 15)
        authorize @restaurants
      end
    end
  end
end
