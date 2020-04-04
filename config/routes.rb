Rails.application.routes.draw do
  resources :cities
  resources :favourites
  resources :tours
  resources :users
  resources :points
  resources :guides
  resources :places
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
