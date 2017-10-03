Rails.application.routes.draw do
  root to: 'home#index', as: 'home'

  devise_for :users
  resources :messages, except: [:edit, :update, :show, :new, :create]
  # Add username vanity url...
  get ':username', to: 'messages#new', as: "user_messages"
  post ':username', to: 'messages#create'
  put 'favorite/:id', to: 'messages#make_favorite', as: "make_favorite"
  put 'unfavorite/:id', to: 'messages#remove_favorite', as: "remove_favorite"
end
