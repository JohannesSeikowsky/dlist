Rails.application.routes.draw do

  root "pages#home"

  get "why", to: "pages#why", as: "why"
  get "how", to: "pages#how", as: "how"

  get "signup", to: "users#new", as: "signup"
  post "users", to: "users#create", as: "users"
  
  get "login", to: "user_sessions#new", as: "login"
  post "user_sessions", to: "user_sessions#create", as: "to_login"

  resources :users do
    resources :dones
  end
  
end


