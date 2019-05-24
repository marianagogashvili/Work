Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home', to: 'pages#home', as: "root"
  post 'home', to: 'pages#home2'
  # post 'home/:id', to: 'pages#job', as: "select_job"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'register', to: 'employees#new', as: "register"
  resources :employees, except: [:new]

  post 'search', to: 'jobs#search', as: "search"
  get 'jobs', to: 'jobs#index'
  resources :jobs, except: [:index]
  resources :employers
  post 'job/:id/save', to: 'jobs#save', as: "save"
  delete 'job/:id/del_save', to: 'jobs#del_save', as: "del_save"
  

  post 'apply/:id', to: 'job_employees#create', as: "apply"
  post 'job/:job_id/approve/:id',to: 'job_employees#approve', as: "approve"
  post 'job/:job_id/disapprove/:id',to: 'job_employees#disapprove', as: "disapprove"

  resources :chats, only: [:create, :show]
end