Rails.application.routes.draw do
  root to: "kingdoms#index"

  resources :kingdoms, only: %i(index new create show) do
    member do
      post :upvote
    end
  end
  resources :cards, only: %i(index)
  resources :plays, only: %i(new create)

  namespace :api do
    namespace :v1 do
      resources :kingdoms, only: %i() do
        member do
          post :rating
        end
      end
    end
  end
end
