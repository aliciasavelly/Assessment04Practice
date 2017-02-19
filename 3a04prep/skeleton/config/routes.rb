Links::Application.routes.draw do
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

  resources :users, :comments, :links
  resource :session
end
