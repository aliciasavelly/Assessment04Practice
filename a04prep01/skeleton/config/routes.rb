Links::Application.routes.draw do
  get 'links/new'

  get 'links/edit'

  get 'links/update'

  get 'links/create'

  get 'links/destroy'

  get 'links/show'

  get 'links/index'

  resources :users, only: [:new, :create]
  resources :comments, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :links, only: [:index, :new, :create, :destroy, :edit, :update]
  resource :session, only: [:index, :new, :create, :destroy, :edit, :update]
end
