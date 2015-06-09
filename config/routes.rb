Rails.application.routes.draw do

  require "sidekiq/web"
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
  end if Rails.env.production?
  mount Sidekiq::Web, at: "/sidekiq"

  resources :profiles, except: [ :destroy, :show ]

  devise_for :users
  get 'page/index'

  root "page#index"
end
