Rails.application.routes.draw do

  devise_scope :user do
    put '/users/avatar', to: 'update_users#update_avatar'
    put '/users/email', to: 'update_users#update_email'
    put '/users/password', to: 'update_users#update_password'
  end

  devise_for :users

  root to: 'pages#home'
  get  '/cuisines',               to: 'cuisines#index'                           # cuisines' index
  get  '/cuisines/:id',           to: 'cuisines#show', as: 'cuisine'             # one cuisine's show
  get  '/cuisines/:id/search',    to: 'cuisines#search', as: :cuisine_search
  get  '/restaurants/map',        to: 'restaurants#map'                          # restaurants' map
  get  '/restaurants/list',       to: 'restaurants#list'                         # restaurants' list
  get '/restaurants/list/dish/:id', to: 'restaurants#list_per_dish', as: :restaurant_dish
  get  '/search',                 to: 'searches#find'                            # search in models
  get  '/restaurants/:id',        to: 'restaurants#show', as: 'restaurant'       # one restaurant's show and its reviews
  get  '/restaurants/new',        to: 'restaurants#new'                          # create a new restaurant
  post '/restaurants/:id/review', to: 'reviews#create', as: 'restaurant_reviews' # add a review
  put  '/restaurants/:id/review', to: 'reviews#react'                            # react to one review
end
