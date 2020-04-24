Rails.application.routes.draw do
  resources :place_images
  devise_for :guides
  devise_for :models
  resources :cities
  resources :favourites

  resources :tours do
    resources :places
  end

  resources :users
  resources :points
  resources :guides
  resources :places
  post 'tours/add_to_favourite'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
