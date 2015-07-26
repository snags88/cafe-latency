Rails.application.routes.draw do
  root 'stores#search'

  get 'stores/search', to: 'stores#search', as: 'search'

  resources :stores, only: [:index, :show]
  resources :tests, only: [:new, :create]
end
