Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  resources :cities
  resources :favourites
  resources :tours
  resources :users
  resources :points
  resources :users
  resources :places
  post 'tours/add_to_favourite'
  
  # For details on the DSL available within this file, see https://users.rubyonrails.org/routing.html
end
