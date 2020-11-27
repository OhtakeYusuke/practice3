Rails.application.routes.draw do
  root to: "posts#index"
  
  resources :posts
  
  resources :users

  resources :login, only: [:new, :create, :destroy], controller: :sessions
end
