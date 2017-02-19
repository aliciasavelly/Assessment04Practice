Links::Application.routes.draw do
  root to: "sessions#new"
  resources :users, only: [:new, :create]
  resources :comments, only: [:create, :destroy]
  resources :links
  resource :session, only: [:new, :create, :destroy]
end
