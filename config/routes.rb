Rails.application.routes.draw do
  root to: "products#index" #index path
  resources :products, only: [:new, :create] #for importing the json file

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
