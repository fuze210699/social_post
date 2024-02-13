Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'news', to: 'news#index'
      get 'posts/index'
      resources :posts, only: [:index, :create]
    end
  end

  root 'dashboard#index'

  get 'registration', to: 'users#new', as: 'registration'
  post 'registration', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'signin'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # resources :users, only: [:index]
  # resources :posts
end
