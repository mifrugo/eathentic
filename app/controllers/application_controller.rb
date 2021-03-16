class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_cuisines


  private

  def get_cuisines
    @cuisines = Cuisine.all
  end
end
