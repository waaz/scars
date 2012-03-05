Scars::Application.routes.draw do
 

  resources :car_classes

  resources :payements

 get "login" => "sessions#new", :as => "login"
 get "logout" => "sessions#destroy", :as => "logout"
 get "signup" => "users#new", :as => "signup"
 match "profile" => "users#show"
 root :to => 'home#index'
 resources :users
 resources :sessions
 resources :cars
 resources :bookings
end
