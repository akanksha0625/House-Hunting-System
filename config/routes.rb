Rails.application.routes.draw do

  resources :sessions
  resources :replies
  resources :inquiries
  resources :houses
  resources :users
  resources :companies

  root'users#new'
  get 'sessions/new'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'houses/search', to: 'houses#search'
  # root'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
