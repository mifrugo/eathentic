class ApplicationController < ActionController::Base
  before_action :redirect_subdomain
  before_action :get_cuisines
  before_action :get_locations
  before_action :authenticate_user!
  include Pundit

  def redirect_subdomain
    return unless request.host == 'eathentic.app' || request.host == 'eathentic.herokuapp.com'

    redirect_to "https://www.eathentic.app#{request.fullpath}", status: 301
  end

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[cuisine_id nickname])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def get_cuisines
    @cuisines = Cuisine.all
  end

  def get_locations
    @locations = Location.all
  end
end
