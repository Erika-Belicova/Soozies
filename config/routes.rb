Rails.application.routes.draw do
  devise_for :users
   root to: "pages#home"

  # resources :soozies
  # get "/users", to: "users#index"

  resources :soozies do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: :index
  resources :offers, only: :index
end
