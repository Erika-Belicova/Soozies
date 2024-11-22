Rails.application.routes.draw do
  devise_for :users
   root to: "pages#home"

  # resources :soozies
  # get "/users", to: "users#index"

  resources :soozies do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index] do
    member do
      patch "/validate", to: "bookings#validate_booking"
    end
  end

  resources :users, only: [:show] do
    resources :offers, only: :index
  end
end
