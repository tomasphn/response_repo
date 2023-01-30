Rails.application.routes.draw do
  root "home#index"

  get "/responses", to: "response#index"
  get "/search", to: "home#search"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :prompts do
    resources :responses do
      resources :reactions, only: [:index, :create, :destroy]
    end
  end
end
