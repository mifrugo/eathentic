class ReactionsController < ApplicationController
  before_action :set_review
  def create
    @reaction = Reaction.new(set_params)
    @reaction.review = @review
    @reaction.user = current_user
    authorize @reaction
    if @reaction.save!
      render json: { action: "saved", counter: @review.counter }.to_json
    else
      render json: { action: "error", counter: @review.counter }.to_json  
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