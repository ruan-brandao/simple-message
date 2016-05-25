Rails.application.routes.draw do
  root 'messages#index'

  devise_for :users

  resources :messages, only: [:index, :show, :new, :create, :destroy]
end
