Rails.application.routes.draw do
  root to: 'messages#index'
  resources :messages, except: [:edit, :update, :show]
end
