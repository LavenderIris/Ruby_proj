Rails.application.routes.draw do
  get '/'  => 'sessions#index'

  post '/users/create'  => 'users#create'
  post '/users/login'  => 'sessions#login'
  get '/users/:id' => 'users#show'
  get '/dashboard'  => 'users#show_dashboard'

  get '/friends/create' => 'friends#create'
  delete '/friends/:id' => 'friends#destroy'
  post '/friends/:id' => 'friends#create'

  post '/bands/new' => 'bands#new'
  get '/bands' => 'bands#index'
  get '/bands/:id' => 'bands#show'
  post '/bands/:id/wish' => 'wish#create'

  get '/concerts/index' => 'concerts#index'
  get '/main'  => "concerts#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
