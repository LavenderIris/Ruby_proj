Rails.application.routes.draw do
  get 'bands/index'

  get ''  => 'sessions#index'
  get 'main'  => "bands#index"
  post 'users/create'  => 'users#create'
  post 'users/login'  => 'sessions#login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
