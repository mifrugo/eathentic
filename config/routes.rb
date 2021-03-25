Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_scope :user do
    put '/users/avatar', to: 'update_users#update_avatar'
    put '/users/email', to: 'update_users#update_email'
    put '/users/password', to: 'update_users#update_password'
  end

  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/search', to: 'search#index'
      post '/favorites', to: 'favorites#create'
      get '/restaurants', to: 'restaurants#show'
    end
  end

  root to: 'pages#home'
  get  '/cuisines',               to: 'cuisines#index'                           # cuisines' index
  get  '/cuisines/:id',           to: 'cuisines#show', as: 'cuisine'             # one cuisine's show
  get  '/cuisines/:id/search',    to: 'cuisines#search', as: :cuisine_search
  get  '/restaurants/map',        to: 'restaurants#map'                          # restaurants' map
  get  '/restaurants/list',       to: 'restaurants#list'                         # restaurants' list
  get  '/restaurants/list/search', to: 'restaurants#search_list', as: :restaurant_search
  get '/restaurants/list/dish/:id', to: 'restaurants#list_per_dish', as: :restaurant_dish
  get '/restaurants/list/dish/:id/search', to: 'restaurants#search_dish', as: :restaurant_dish_search
  post '/restaurants/:id/add_dish', to: 'restaurants#add_dish', as: :add_dish

  post '/restaurants/:id/favorite', to: 'restaurants#favorite'
  post '/dishes/:id/favorite', to: 'dishes#favorite'

  get '/location/:id',            to: 'restaurants#location_list', as: :location
  get '/location/:id/search',     to: 'restaurants#search_location', as: :location_search
  get  '/restaurants/:id',        to: 'restaurants#show', as: 'restaurant'       # one restaurant's show and its reviews
  post '/reviews/:id/reactions',  to: 'reactions#create', as: :reaction
  get  '/restaurants/:id/search', to: 'restaurants#search', as: :restaurant_show_search
  get  '/restaurants/new',        to: 'restaurants#new'                          # create a new restaurant
  post '/restaurants',            to: 'restaurants#scrape', as: :restaurant_scrape
  post '/restaurants/:id/review', to: 'reviews#create', as: 'restaurant_reviews' # add a review
end
