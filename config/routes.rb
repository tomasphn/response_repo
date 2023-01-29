Rails.application.routes.draw do
  root "home#index"

  get "/responses", to: "response#index"
  get "/search", to: "home#search"

  devise_for :users, :controllers => { registrations: 'users' }
  post 'user_registration', to: 'users#create'

  resources :prompts do
    resources :responses do
      resources :reactions
    end
  end
end
