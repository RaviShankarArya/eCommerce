Rails.application.routes.draw do

  root 'home#index'
  resources :product_categories
  get     'home' => "home#index",:as => :admin_home

end
