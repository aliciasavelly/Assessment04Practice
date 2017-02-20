Links::Application.routes.draw do
  resources :users, :links, :comments
  resource :session
end
