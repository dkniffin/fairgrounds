Rails.application.routes.draw do
  root to: "kingdoms#index"

  resources :kingdoms, only: %i(index new create)
  resources :cards, only: %i(index)
end
