Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'home#index'

  resources :products, only: %i(index new create edit update)
  resources :costs, only: %i(index show new create)
  resources :purchases, only: %i(new create destroy)
  resources :incomes
  resources :reports, only: %i(index)
end
