Rails.application.routes.draw do
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  get 'users/_form'
  root "tasks#index"
  resources :tasks
end
