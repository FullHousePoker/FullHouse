Rails.application.routes.draw do
  resources :users, only: [:create, :update, :destroy, :index]
  resources :games, only: [:create, :update, :destroy, :index] do
    collection do
      get :nearby_games
    end
  end

  # root 'welcome#index'
end
