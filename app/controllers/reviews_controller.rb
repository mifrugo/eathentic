class ReviewsController < ApplicationController
  before_action :set_restaurant
  def create
    if current_user.cuisine_id == @restaurant.cuisine_id
      @review = Review.new(review_params)
      @review.user = current_user
      @review.restaurant = @restaurant
      if @review.save
        redirect_to restaurant_path(@restarant)
      else
        render :error
      end    
    else
    render :error
    end 
  end

  private
  
  def set_restaurant
    @restaurant = Resaurant.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end  
end
