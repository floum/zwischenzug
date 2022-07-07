Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :session, only: [:new, :create]
  delete 'session', to: 'session#destroy'
  resources :users, only: [:new, :create, :update]

  resources :games, only: [:index, :new, :create, :destroy, :show]
  post 'games/import', to: 'games#import'

  get 'games/:game_id/analysis', to: 'game_analysis#show', as: 'game_analysis'
  post 'games/:game_id/analysis', to: 'game_analysis#update', as: 'update_game_analysis'
  patch 'games/:game_id/analysis', to: 'game_analysis#update'

  root 'games#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
