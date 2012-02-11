Nittymail::Application.routes.draw do
  root to: 'home#index'

  get "users/show"
  match 'subscriptions' => 'subscribers#edit', as: 'edit_subscriber', via: :get
  match 'thankyou' => 'subscribers#thankyou', as: 'thank_you_for_subscribing', via: :get
  match 'manage' => 'manage#index', as: :manage, via: :get

  devise_for :users
  devise_for :subscribers

  resources :users, only: [:show], path: ''
  resources :subscribers, only: [:create, :update, :destroy]

end
