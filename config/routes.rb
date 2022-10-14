# frozen_string_literal: true

Rails.application.routes.draw do
  resources :saleitems
  resources :sales
  resources :prices
  resources :products do
    get '/store/:store_id', to: 'products#products_by_store', on: :collection, as: 'author'
  end
  resources :categories
  resources :stores
  get '/current_user', to: 'current_user#index'

  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }
end
