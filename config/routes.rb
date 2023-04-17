Rails.application.routes.draw do
  root 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :places
  resources :users
end
