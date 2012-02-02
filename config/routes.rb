Scars::Application.routes.draw do
 get "login" => "sessions#new", :as => "login"
 get "logout" => "sessions#destroy", :as => "logout"
 get "signup" => "users#new", :as => "signup"
 root :to => 'home#index'
 resources :users
 resources :sessions
end
