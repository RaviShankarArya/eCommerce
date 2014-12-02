Rails.application.routes.draw do

  root 'home#index'
  resources :product_categories
  resources :product_types
  resources :product_details
  get     'home' => "home#index",:as => :admin_home


  namespace :api do
    namespace :v1 do
      #get 'info/server' => 'info#server'
      get  'product_categories' => 'product_categories#index'
      get  'product_types' => 'product_types#index'
      get  'product_details' => 'product_details#index'
      post 'sign_up' => 'users#create'
    end
  end




end
