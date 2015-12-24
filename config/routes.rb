Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :games, only: [:index] do
    collection do
      get :nearby_games
    end
  end

  # root 'welcome#index'
end
