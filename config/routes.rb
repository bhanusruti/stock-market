Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  get '/home', to: 'users#show'
  post '/users', to: 'users#create'

  get '/about', to: 'pages#about'

  root to: 'pages#welcome' # '/' path
  
  get '/users/:id', to: 'users#show'

  get '/companies/:id', to: 'companies#show'
  get '/companies', to: 'companies#index'

  get '/search', to:'companies#search_results'
  post '/search', to: 'companies#search'

  post '/votes', to: 'votes#create'


end
