Rails.application.routes.draw do
  root to: "kingdoms#index"

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"

  resources :kingdoms, only: %i(index new create show) do
    member do
      post :upvote
    end
  end
  resources :cards, only: %i(index)
  resources :plays, only: %i(new create)

  get :credits, to: "application#credits"
  get :admin, to: "application#admin"
  get :graphql_test, to: "kingdoms#graphql_test"
end
