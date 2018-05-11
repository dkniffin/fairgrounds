Rails.application.routes.draw do
  root to: "kingdoms#index"

  resource :kingdoms, only: %i(index new create)
end
