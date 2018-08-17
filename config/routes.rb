Rails.application.routes.draw do
  resources :violations
  resources :car_features
  resources :cars do
    collection do
      
    end
  end
  get 'car_steps', to: 'cars#car_steps',as: :car_steps
  get 'personaldetails', to: 'cars#personaldetails',as: :personaldetails
  get 'driverlicensedetails', to: 'cars#driverdetails',as: :driverdetails
  get 'pickupdetails', to: 'cars#pickupdetails',as: :pickupdetails
  get 'my_garage', to: 'users#my_garage',as: :my_garage
  get 'my_documents', to: 'users#my_documents',as: :my_documents
  get 'inbox', to: 'users#inbox',as: :inbox
  get 'my_bookings', to: 'users#my_bookings',as: :my_bookings
  get 'my_payments', to: 'users#my_payments',as: :my_payments
  
  
  post 'listing_criteria', to: 'cars#submit_listing_criteria',as: :listing_criteria
  
  
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'
  get 'admin', to: 'home#admin', as: :admin
  get 'car_management',to: 'home#car_management'
  get 'how_it_works', to: 'home#how_it_works'
  get 'policies', to: 'home#policies'
  get 'contact_us', to: 'home#contact_us'
  get 'listing_criteria', to: 'home#listing_criteria'
  get 'mass_email', to: 'home#mass_email',as: :mass_email
  # delete 'delete_commentfile/:comment_file_id(.:format)',to: 'users#delete_commentfile',as: :comment_file
  # get 'users/profile/edit', to: 'users#edit_profile', as: :edit_profile
  resources :users
  resources :car_steps
  resources :comment_files
  # , path: '/users/profile'
  mount Bulky::Engine => "/bulky"
end
