Rails.application.routes.draw do
  get '/'  => 'sessions#index'
  delete '/session' => 'sessions#index'

  post '/users/create'  => 'users#create'
  post '/users/login'  => 'sessions#login'
  get '/users/:id' => 'users#show'
  get '/dashboard'  => 'users#show_dashboard'

  get '/friends/create' => 'friends#create'
  delete '/friends/:id' => 'friends#destroy'
  post '/friends/:id' => 'friends#create'
  post '/find_friend'  => 'users#find_friend'

  post '/bands/new' => 'bands#new'
  get '/bands/new' => 'bands#new'
  get '/concerts' => 'concerts#index'
  post '/concerts' => 'concerts#index'
  
  get '/bands' => 'bands#index'
  get '/bands/:id' => 'bands#show'
  post '/bands/:id/wish' => 'wish#create'

  get '/concerts/index' => 'concerts#index'
  get '/concerts' => 'concerts#index'
  get '/main'  => "concerts#index"

  post '/concert_attended' => 'concerts#attended'
  get '/concerts/all' => 'concerts#all'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
