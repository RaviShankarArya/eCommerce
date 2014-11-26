Rails.application.routes.draw do

  root 'home#index'
  resources :product_categories
  resources :product_types
  get     'home' => "home#index",:as => :admin_home


  namespace :api do
    namespace :v1 do
      #get 'info/server' => 'info#server'
      get  'product_categories' => 'product_categories#index'
      get  'product_types' => 'product_types#index'
    end
  end




end
