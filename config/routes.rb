Rails.application.routes.draw do
  root 'tasks#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users
  end
  resources :tasks do
    collection do
      get :search_name
    end
  end
end
