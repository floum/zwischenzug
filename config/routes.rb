Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :session, only: [:new, :create]
  delete 'session', to: 'session#destroy'
  resources :users, only: [:new, :create, :update]

  resources :games, only: [:index, :new, :create, :destroy, :show] do
    post :import, on: :collection
  end

  resources :game_analysis

  root 'games#index'

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
