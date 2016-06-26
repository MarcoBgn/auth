Rails.application.routes.draw do

  root 'users#new'
  resource :dashboard, only: [:show]
  resources :users, only: [:new, :create]
end
