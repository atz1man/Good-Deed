Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root to: "pages#home"
  get "users/:id", to: "users#show", as: :user

  resources :recipients do
  get "confirmation", to: "donations#confirmation", as: :confirmation
    resources :donations, only: %i[new create]
  end
  # get "confirmation", to: "donations#confirmation", as: :confirmation

  resources :recipients do
    resources :messages, only: [:new]
  end
end
