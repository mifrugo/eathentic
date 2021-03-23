class ReactionsController < ApplicationController
  before_action :set_review
  def create
    @reaction = Reaction.new(number: params[:value])
    @reaction.review = @review
    @reaction.user = current_user
    authorize @reaction
    if @reaction.save!
      redirect_to restaurant_path(@review.restaurant_id)
    else
      flash.alert = "Reaction not submitted."  
    end
  end  

  private

  def set_params
    params.require(:reaction).permit(:number)
  end

  def set_review
    @review = Review.find(params[:id])
  end  
end