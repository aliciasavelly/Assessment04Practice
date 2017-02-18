Links::Application.routes.draw do
  resources :users, only: [:new, :create]
  resources :comments, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :links, only: [:index, :new, :create, :destroy, :edit, :update]
end
