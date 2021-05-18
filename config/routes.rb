Rails.application.routes.draw do
  get 'tasks/_form,'
  get 'tasks/edit,'
  get 'tasks/index,'
  get 'tasks/new,'
  get 'tasks/show'
  resources :tasks
end
