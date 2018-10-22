Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  resources :welcome, only: [:show, :index]
  resources :users, only: [:show, :index, :create, :edit, :update]
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
