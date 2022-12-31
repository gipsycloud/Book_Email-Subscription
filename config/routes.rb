require 'sidekiq/web'

Rails.application.routes.draw do

  # root "projects#index"

  resources :projects do
    resources :tasks
  end

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: "authors#index"
    end

    unauthenticated do
      root to: "home#index", as: :unauthenticated_root
    end
  end

  

  resources :subscribers
  namespace :api, defaults: { format: 'json' } do
    resources :subscribe
  end
  # root to: 'authors#index'
  resources :book_managements do
    get 'publish'
    get "download_pdf"
  end
  resources :categories
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
