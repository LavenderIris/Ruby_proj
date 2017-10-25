Rails.application.routes.draw do
  get '/concerts/index' => 'concerts#index'
  get '/'  => 'sessions#index'
  get '/main'  => "concerts#index"
  post '/users/create'  => 'users#create'
  post '/users/login'  => 'sessions#login'
  get '/friends/create' => 'friends#create'
  get '/users/:id' => 'users#show'
  delete '/friends/:id' => 'friends#destroy'
  post '/friends/:id' => 'friends#create'
  get '/dashboard'  => 'users#show_dashboard'

  post '/bands/new' => 'bands#new'
  get '/bands/new' => 'bands#new'
  get '/bands' => 'bands#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
