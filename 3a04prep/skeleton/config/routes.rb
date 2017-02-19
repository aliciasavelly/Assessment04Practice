Links::Application.routes.draw do
  resources :users
  resources :comments
  resources :links
  resource :session
end
