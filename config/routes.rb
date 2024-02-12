Rails.application.routes.draw do
  root 'dashboard#index'

  get 'registration', to: 'users#new', as: 'registration'
  post 'registration', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:index]
  resource :session, only: [:create, :destroy], path: 'login', path_names: { new: '' }
  resources :posts
end
