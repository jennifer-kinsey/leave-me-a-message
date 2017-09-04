Rails.application.routes.draw do
  devise_for :users
  root to: 'messages#index'
  resources :messages, except: [:edit, :update, :show]
end
