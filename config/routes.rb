Rails.application.routes.draw do
  resources :car_features
  resources :cars
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'
  get 'admin', to: 'home#admin', as: :admin
  # get 'users/profile/edit', to: 'users#edit_profile', as: :edit_profile
  resources :users
  resources :car_steps
  # , path: '/users/profile'

end
