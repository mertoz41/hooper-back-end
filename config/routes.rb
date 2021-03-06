Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :locations, only: [:index]
  resources :feedbacks, only: [:create]
  resources :users, only: [:index, :show, :create]
  resources :postings, only: [:index, :create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/check', to: 'auth#checking'
end
