Rails.application.routes.draw do
  root to: 'home#index', as: 'home'

  devise_for :users
  resources :messages, except: [:edit, :update, :show, :new, :create, :thanks]
  # Add username vanity url...
  get ':username', to: 'messages#new', as: "user_messages"
  post ':username', to: 'messages#create'
  get 'thanks', to: 'thanks#index', as: "thanks"

end
