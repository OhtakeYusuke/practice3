Rails.application.routes.draw do
  root to: "posts#index"
  
  resources :posts do
    post "confirm", on: :new
  end
  resources :users

  resources :login, only: [:new, :create, :destroy], controller: :sessions
end
