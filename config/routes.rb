Rails.application.routes.draw do
  root 'stores#index'

  get '/search', to: 'stores#search', as: 'search'

  resources :stores, only: [:index, :show]
  resources :tests, only: [:new]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :tests, only: [:create]
    end
  end
end
