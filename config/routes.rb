Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get  '/cuisines',               to: 'cuisines#index'   # cuisines' index
  get  '/cuisines/:id',           to: 'cuisines#show'    # one cuisine's show
  get  '/restaurants/map',        to: 'restaurants#map'  # restaurants' map
  get  '/restaurants/list',       to: 'restaurant#list'  # restaurants' list
  get  '/search',                 to: 'searches#find'    # search in models
  get  '/restaurants/:id',        to: 'restaurants#show' # one restaurant's show and its reviews
  get  '/restaurants/new',        to: 'restaurants/new'  # create a new restaurant
  post '/restaurants/:id/review', to: 'reviews/create'   # add a review
  put  '/restaurants/:id/review', to: 'reviews/react'    # react to one review
end
