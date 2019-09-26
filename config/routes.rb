Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'users/sign_up', to: "users#new"
  get 'users/sign_in', to: 'sessions#new'
  post 'users', to: "users#create"

  resources :sessions, only: [:create, :destroy]

 
  
  


end
