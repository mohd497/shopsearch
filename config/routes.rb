Rails.application.routes.draw do
  root to: "products#index" #index path
  resources :products, only: [:new, :create, :show] #for importing the json file
  get '/softs', to: 'products#all_software'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
