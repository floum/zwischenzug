Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :session, only: [:new, :create]
  delete 'session', to: 'session#destroy'
  resources :users, only: [:new, :create, :update]

  resources :games, only: [:index, :new, :create, :destroy, :show]
  resources :game_analysis
  post 'games/import', to: 'games#import'

  root 'games#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
