Rails.application.routes.draw do
  get 'sessions/new'
  root "home#index"

  get "/responses", to: "response#index"
  get "/signin", to: "sessions#new"
end
