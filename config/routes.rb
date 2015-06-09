Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :profiles, except: [ :destroy, :show ]

  devise_for :users
  get 'page/index'

  root "page#index"
end
