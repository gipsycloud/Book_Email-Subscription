Rails.application.routes.draw do
  devise_for :users
    root "tasks#index"
  resources :tasks
  resources :projects
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
