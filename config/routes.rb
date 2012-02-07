Nittymail::Application.routes.draw do
  get "users/show"

  root to: 'home#index'

  match 'manage' => 'manage#index', as: :manage

  devise_for :users

  resources :users, only: [:show], path: ''

end
