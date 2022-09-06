Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show]
  resources :recipients do
    resources :donations, only: %i[show new create index]
  end
end
