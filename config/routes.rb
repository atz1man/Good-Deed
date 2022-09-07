Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "users/:id", to: "users#show", as: :user

  resources :recipients do
    resources :donations, only: %i[create]
  end
end
