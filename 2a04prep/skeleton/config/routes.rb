Links::Application.routes.draw do
  get 'comments/new'

  get 'comments/create'

  get 'comments/destroy'

  get 'links/index'

  get 'links/show'

  get 'links/new'

  get 'links/create'

  get 'links/edit'

  get 'links/update'

  get 'links/destroy'

  resources :users, :links, :comments
  resource :session

end
