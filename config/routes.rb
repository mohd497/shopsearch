Rails.application.routes.draw do
  resources :interview_questions
  resources :interview_categories
  resources :reviews
  root to: "products#index" #index path
  resources :products, only: [:new, :create, :show] #for importing the json file
  get '/softs', to: 'products#all_software'
  get '/icategories', to: 'interview_categories#all_categories'
  get '/reviews_per_house/:sfthouse_id', to: 'reviews#reviews_per_house'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
