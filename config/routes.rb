Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :games, only: [:create] do
        member do
          post :start_game
          post :mark_users_ready
        end
      end
      resources :messages, only: [:create]
    end
  end
end
