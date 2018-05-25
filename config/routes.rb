Rails.application.routes.draw do
  root to: "kingdoms#index"

  resources :kingdoms, only: %i(index new create) do
    member do
      post :upvote
    end
  end
  resources :cards, only: %i(index)

  namespace :api do
    namespace :v1 do
      resources :kingdoms, only: %i() do
        member do
          post :upvote
        end
      end
    end
  end
end
