Rails.application.routes.draw do
  resources :profiles, except: [ :destroy, :show ]

  devise_for :users
  get 'page/index'

  root "page#index"
end
