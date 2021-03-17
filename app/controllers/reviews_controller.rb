class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[create]

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: "Review succesfully created!"
    else
      render 'restaurants/show', notice: "Invalid input"
    end
  end

  def react
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
