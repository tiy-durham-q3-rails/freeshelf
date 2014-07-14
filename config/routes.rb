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
    get 'tags' => 'books#edit_tags', :on => :member, :as => :edit_tags
    patch ':id/tags' => 'books#update_tags', :on => :collection
  end
  resources :videos, except: [:destroy] do
    get 'tags/:tag' => 'video#tags', :on => :collection, :as => :tag
  end
  get 'sort' => 'books#sort'
  resources :favorites, only: [:create, :destroy, :show]

  root 'books#index'
end
