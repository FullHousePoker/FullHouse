Rails.application.routes.draw do
  resources :users, only: [:create, :update, :destroy, :index]
  resources :games, only: [:index]

  # root 'welcome#index'
end
