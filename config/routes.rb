Rails.application.routes.draw do

  root 'users#new'
  get 'sessions' => 'sessions#new'
  resource :dashboard, only: [:show]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
