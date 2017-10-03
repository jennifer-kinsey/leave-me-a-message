Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :messages, except: [:edit, :update, :show]
  # Add username vanity url...
  # post 'users'
  # get 'photos/:id/:user_id', to: 'photos#show'

end
