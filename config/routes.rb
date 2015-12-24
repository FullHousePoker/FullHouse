Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :games, only: [:index]

  # root 'welcome#index'
end
