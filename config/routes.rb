Rails.application.routes.draw do
  resources :violations
  resources :car_features
  resources :cars do
    collection do
      
    end
  end
  get 'car_steps', to: 'cars#car_steps',as: :car_steps
  post 'listing_criteria', to: 'cars#submit_listing_criteria',as: :listing_criteria
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'
  get 'admin', to: 'home#admin', as: :admin
  get 'car_management',to: 'home#car_management'
  get 'how_it_works', to: 'home#how_it_works'
  get 'policies', to: 'home#policies'
  get 'contact_us', to: 'home#contact_us'
  get 'mass_email', to: 'home#mass_email',as: :mass_email
  # delete 'delete_commentfile/:comment_file_id(.:format)',to: 'users#delete_commentfile',as: :comment_file
  # get 'users/profile/edit', to: 'users#edit_profile', as: :edit_profile
  resources :users
  resources :car_steps
  resources :comment_files
  # , path: '/users/profile'
  mount Bulky::Engine => "/bulky"
end
