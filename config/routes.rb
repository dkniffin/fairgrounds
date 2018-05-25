Rails.application.routes.draw do
  root to: "kingdoms#index"

  resources :kingdoms, only: %i(index new create) do
    member do
      post :upvote
    end
  end
  resources :cards, only: %i(index)
end
