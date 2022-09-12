Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "users/:id", to: "users#show", as: :user

  resources :recipients do
    resources :donations, only: %i[new create] do
      get "confirmation", to: "donations#confirmation", as: :confirmation
    end
  end
end
