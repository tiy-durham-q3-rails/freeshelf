Rails.application.routes.draw do
  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy', as: 'logout'

  resources :suggestions, only: [:index]
  resources :password_resets, only: [:new, :create, :show, :update]
  resources :users, only: [:create]
  resources :books, except: [:destroy] do
    get 'tags/:tag' => 'books#tags', :on => :collection, :as => :tag
  end
  resources :favorites, only: [:create, :destroy]

  root 'books#index'
end
