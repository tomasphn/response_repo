Rails.application.routes.draw do
  root "home#index"

  get "/responses", to: "response#index"
end
