Rails.application.routes.draw do
  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy', as: 'logout'

  resources :password_resets, only: [:new, :create, :show, :update]
  resources :users, only: [:create]
  resources :books

  root 'books#index'
end
