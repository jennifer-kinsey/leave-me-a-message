Rails.application.routes.draw do
  devise_for :users, :path => 'u'
  root to: 'home#index'

  resources :users, only: [:show] do
    resources :messages, except: [:edit, :update, :show]
  end
end
