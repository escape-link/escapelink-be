Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v0 do
      resources :games, only: [:create]
      resources :messages, only: [:create]

      get '/:room_id/:game_name', to: 'games#show', as: :game_channel
    end
  end
end
