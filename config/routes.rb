Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :session, only: [:new, :create]
  delete 'session', to: 'session#destroy'
  resources :users, only: [:new, :create, :update]
  get 'analysis/create'
  root 'positions#index'

  resources :positions, only: [:show, :index] do
    resources :analysis, only: [:create]
  end

  resources :analysis, only: [:show, :destroy]

  resources :games, only: [:index, :new, :create, :destroy, :show]
  resources :game_analysis, only: [:new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
