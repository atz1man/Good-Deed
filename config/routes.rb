Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "users/:id", to: "users#show", as: :user
  # get "donations/:id", to: "donations#create", as: :user

  resources :recipients do
    resources :donations, only: %i[new create]
  end
end
