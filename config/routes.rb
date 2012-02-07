Nittymail::Application.routes.draw do
  root to: 'home#index'

  match 'manage' => 'manage#index', as: :manage

  devise_for :users

end
