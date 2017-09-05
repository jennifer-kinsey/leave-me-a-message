Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :users, only: [:show] do
    resources :messages, except: [:edit, :update, :show]
  end
end
