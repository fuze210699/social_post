Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'posts/index'
      resources :posts, only: [:index, :create]
    end
  end

  root 'dashboard#index'

  get 'registration', to: 'users#new', as: 'registration'
  post 'registration', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:index]
  resource :session, only: [:create, :destroy], path: 'login', path_names: { new: '' }
  resources :posts
end
