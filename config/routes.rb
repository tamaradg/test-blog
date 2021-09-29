Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  root to: 'pages#home'

  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
  end
end
