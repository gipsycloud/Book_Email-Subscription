Rails.application.routes.draw do
  root to: 'authors#index'
  resources :book_managements
  resources :categories
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
