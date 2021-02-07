Rails.application.routes.draw do
  resources :books
  resources :receiveds
  resources :sponsors
  resources :waitings
  resources :waitlists
  resources :reviews
  resources :users

  post '/users/login', to: 'users#login'

  post '/waitings/sponsor/:id', to: 'waitings#sponsor'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
