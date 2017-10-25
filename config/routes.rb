Rails.application.routes.draw do
  get 'bands/index'

  get ''  => 'sessions#index'
  get 'main'  => "bands#index"
  post 'users/create'  => 'users#create'
  post 'users/login'  => 'sessions#login'
  get 'friends/create' => 'friends#create'
  get 'users/:id' => 'users#show'
  delete '/friends/:id' => 'friends#destroy'
  post '/friends/:id' => 'friends#create'
  get '/dashboard'  => 'users#show_dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
