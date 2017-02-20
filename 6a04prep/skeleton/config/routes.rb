Links::Application.routes.draw do
  get 'comments/create'

  get 'comments/destroy'

  get 'links/index'

  get 'links/show'

  get 'links/new'

  get 'links/create'

  get 'links/edit'

  get 'links/update'

  get 'links/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/new'

  get 'users/create'

  resources :users, :links, :comments
  resource :session
end
