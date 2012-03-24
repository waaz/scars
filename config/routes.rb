Scars::Application.routes.draw do
  resources :orders

 resources :car_classes

 get "login" => "sessions#new", :as => "login"
 get "logout" => "sessions#destroy", :as => "logout"
 get "signup" => "users#new", :as => "signup"
 root :to => 'home#index'
 match "admin" => "home#admin"
 resources :users
 resources :customers
 resources :sessions
 resources :cars
 resources :bookings do
   resources :payements
 end
end
