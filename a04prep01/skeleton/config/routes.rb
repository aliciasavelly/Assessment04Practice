Links::Application.routes.draw do
  get 'sessions/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'sessions/edit'

  get 'sessions/update'

  get 'sessions/show'

  resources :users, only: [:new, :create]
  resources :comments, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :links, only: [:index, :new, :create, :destroy, :edit, :update]
end
