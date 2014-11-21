Rails.application.routes.draw do

  root 'home#index'
  resources :product_categories
  get     'home' => "home#index",:as => :admin_home


  namespace :api do
    namespace :v1 do
      #get 'info/server' => 'info#server'
      get  'product_categories' => 'product_categories#index'
    end
  end




end
