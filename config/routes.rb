Rails.application.routes.draw do
  get 'analysis/create'
  root 'positions#index'

  resources :positions, only: [:show, :index] do
    resources :analysis, only: [:create]
  end

  resources :analysis, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
