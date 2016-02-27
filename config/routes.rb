Rails.application.routes.draw do

  root "pages#home"

  # static pages
  get "why", to: "pages#why", as: "why"
  get "how", to: "pages#how", as: "how"

  # user controller routes
  get "signup", to: "users#new", as: "signup"
  post "users", to: "users#create", as: "users"
  
  # session controller routes
  get "login", to: "user_sessions#new", as: "login"
  post "user_sessions", to: "user_sessions#create", as: "to_login"
  delete "logout", to: "user_sessions#logout", as: "logout"

  # nested resource, dones of user
  resources :users do
    resources :dones
  end

end