Rails.application.routes.draw do
  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy', as: 'logout'

  resources :password_resets, only: [:new, :create, :show, :update]
  resources :users, only: [:create, :update]
  resources :favorites, only: [:create, :destroy, :show]

  resources :books, except: [:destroy] do
    get 'tags/:tag' => 'books#index', :on => :collection, :as => :tag
    get 'tags' => 'books#edit_tags', :on => :member, :as => :edit_tags
    patch ':id/tags' => 'books#update_tags', :on => :collection
  end

  resources :videos, except: [:destroy] do
    get 'tags/:tag' => 'video#tags', :on => :collection, :as => :tag
    get 'tags' => 'videos#edit_tags', :on => :member, :as => :edit_tags
    patch ':id/tags' => 'videos#update_tags', :on => :collection
  end

  root 'books#index'
end
