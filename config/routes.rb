Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :locations, only: [:index, :create]
  resources :feedbacks, only: [:create]
  resources :users, only: [:index, :show, :create]
  resources :postings, only: [:index, :create, :show]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/check', to: 'auth#checking'
end
