Rails.application.routes.draw do
  root to: "kingdoms#index"

  resources :kingdoms, only: %i(index new create show) do
    member do
      post :upvote
    end
  end
  resources :cards, only: %i(index)
  resources :plays, only: %i(new create)

  get :credits, to: "application#credits"
end
