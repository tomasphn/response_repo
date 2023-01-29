Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  get "/responses", to: "response#index"
  get "/signin", to: "sessions#new"
  get "/search", to: "home#search"

  resources :prompts do
    resources :responses do
      resources :reactions
    end
  end
end
