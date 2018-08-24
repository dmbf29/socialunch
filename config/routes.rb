Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :lunch_requests, only: [:new, :create, :show, :destroy]
  resources :lunch_dates, only: [:index, :show]
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
