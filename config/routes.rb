Nittymail::Application.routes.draw do
  root to: 'home#index'

  get "users/show"
  match 'subscriptions' => 'subscribers#edit', as: 'edit_subscriber', via: :get
  match 'thankyou' => 'subscribers#thankyou', as: 'thank_you_for_subscribing', via: :get
  match 'already_subscribed' => 'subscribers#already_subscribed', as: 'already_subscribed', via: :get
  match 'manage' => 'manage#index', as: :manage, via: :get
  match 'confirm_opt_in' => 'opt_ins#confirm', as: :confirm_opt_in, via: :get

  if Rails.env.development?
    mount SubscriberMailer::Preview => 'mail_view'
  end

  devise_for :users
  devise_for :subscribers

  resources :users, only: [:show], path: ''
  resources :subscribers, only: [:create, :update, :destroy]

end
