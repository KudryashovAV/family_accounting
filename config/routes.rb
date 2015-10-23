Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'home#index'

  resources :products
  resources :costs, only: %i(index show)
  resources :purchases, only: %i(new create destroy)
end
