Rails.application.routes.draw do
  root to: 'home#index', as: 'home'

  devise_for :users
  resources :messages, except: [:edit, :update, :show, :new, :create]
  # Add username vanity url...
  get 'thanks', to: 'messages#thanks'
  get ':username', to: 'messages#new', as: "user_messages"
  post ':username', to: 'messages#create'

end
