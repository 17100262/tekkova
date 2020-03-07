Rails.application.routes.draw do
  resources :violations
  resources :car_features
  resources :cars do
    get 'details', to: 'cars#carshow', as: :details
  end
  get 'car_steps', to: 'cars#car_steps', as: :car_steps
  get 'research', to: 'cars#research', as: :research
  get 'personaldetails', to: 'cars#personaldetails',as: :personaldetails
  get 'driverlicensedetails', to: 'cars#driverdetails',as: :driverdetails
  get 'pickupdetails', to: 'cars#pickupdetails',as: :pickupdetails
  get 'my_garage', to: 'users#my_garage',as: :my_garage
  get 'my_documents', to: 'users#my_documents',as: :my_documents
  get 'inbox', to: 'users#inbox',as: :inbox
  get 'my_bookings', to: 'users#my_bookings',as: :my_bookings
  get 'my_payments', to: 'users#my_payments',as: :my_payments
  get 'my_ratings', to: 'users#my_ratings',as: :my_ratings
  post 'upload_documents', to: 'users#upload_documents',as: :upload_documents
  get 'delete_document/:document_id', to: 'users#delete_document', as: :delete_user_document
  get 'fee_and_charges', to:'home#fee_and_charges', as: :fee_and_charges
  get 'nd_policy', to: 'home#nd_policy', as: :nd_policy
  get 'privacy_policy', to: 'home#privacy_policy', as: :privacy_policy
  get 'terms_and_conditions', to: 'home#terms_and_conditions', as: :terms_and_conditions
  get 'about_us', to: 'home#about_us', as: :about_us
  post 'listing_criteria', to: 'cars#submit_listing_criteria', as: :listing_criteria
  post 'send_contact_query', to: 'home#send_contact_query', as: :send_contact_query

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }

  devise_scope :user do
    get '/users/auth/google_oauth2/callback' => 'users/omniauth_callbacks#google_oauth2'
    get '/users/auth/facebook/callback' => 'users/omniauth_callbacks#facebook'
    get '/users/auth/failure' => redirect('/')
  end

  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  root 'home#home'
  get 'admin', to: 'home#admin', as: :admin
  get 'car_management',to: 'home#car_management'
  get 'how_it_works', to: 'home#how_it_works'
  get 'policies', to: 'home#policies'
  get 'contact_us', to: 'home#contact_us'
  get 'listing_criteria', to: 'home#listing_criteria'
  get 'mass_email', to: 'home#mass_email',as: :mass_email
  get 'my_handover', to: 'users#my_handover',as: :my_handover
  get 'cleaning_policy', to: 'users#cleaning_policy',as: :cleaning_policy
  get 'engine_policy', to: 'users#engine_policy',as: :engine_policy
  get 'feul_policy', to: 'users#feul_policy',as: :feul_policy
  get 'infringements_policy', to: 'users#infringements_policy', as: :infringements_policy
  get 'late_return_policy', to: 'users#late_return_policy', as: :late_return_policy
  get 'sign_up_page', to: 'users#sign_up_page', as: :sign_up_page

  resources :users
  resources :car_steps
  resources :comment_files
  # , path: '/users/profile'
  mount Bulky::Engine => '/bulky'
end
