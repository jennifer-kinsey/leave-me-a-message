Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :messages, except: [:edit, :update, :show]

end
