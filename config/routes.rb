Rails.application.routes.draw do
  devise_for :users
   root to: "pages#home"

  resources :soozies
  get "/users", to: "users#index"
end
