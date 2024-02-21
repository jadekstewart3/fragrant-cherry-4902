Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :projects, only: :show

  resources :contestants, only: :index

  resources :projects, only: :show

  resources :contestant_projects, only: :create
end

