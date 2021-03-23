Rails.application.routes.draw do

  devise_scope :user do
    put '/users/avatar', to: 'update_users#update_avatar'
    put '/users/email', to: 'update_users#update_email'
    put '/users/password', to: 'update_users#update_password'
  end

  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/search', to: 'search#index'
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

  get '/location/:id', to: 'restaurants#location_list', as: :location
  get '/location/:id/search', to: 'restaurants#search_location', as: :location_search

  get  '/restaurants/:id',        to: 'restaurants#show', as: 'restaurant'       # one restaurant's show and its reviews
  get  '/restaurants/:id/search', to: 'restaurants#search', as: :restaurant_show_search
  get  '/restaurants/new',        to: 'restaurants#new'                          # create a new restaurant
  post '/restaurants',            to: 'restaurants#scrape', as: :restaurant_scrape
  post '/restaurants/:id/review', to: 'reviews#create', as: 'restaurant_reviews' # add a review
  put  '/restaurants/:id/review', to: 'reviews#react'                            # react to one review

end
