Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :session, only: [:new, :create]
  delete 'session', to: 'session#destroy'
  get 'session/lichess', to: 'session#lichess_auth', as: :lichess_sign_in
  get 'lichess_redirect', to: 'session#lichess_redirect', as: :lichess_redirect
  resources :users, only: [:new, :create, :update, :show]

  resources :games do
    post :import, on: :collection
  end

  resources :game_analysis

  root 'game_analysis#index'

  namespace 'api', defaults: {format: :json} do
    resources :games do
      post :import, on: :collection
    end
    resources :game_analysis do
        post :import, on: :collection
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
