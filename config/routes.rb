Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

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
  
  post 'apply/:id', to: 'job_employees#create', as: "apply"
  post 'approve/:id',to: 'job_employees#approve', as: "approve"
  post 'disapprove/:id',to: 'job_employees#disapprove', as: "disapprove"

end