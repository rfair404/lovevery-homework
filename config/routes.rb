Rails.application.routes.draw do
  resources :products, only: [ :index, :show ]
  resources :orders, only: [ :new, :create, :show ]


  root to: "products#index"
end
