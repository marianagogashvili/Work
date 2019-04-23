Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  get 'register', to: 'employees#new'
  resources :employees, except: [:new]

  resources :jobs
end