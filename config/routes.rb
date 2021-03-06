Scars::Application.routes.draw do
  
 resources :car_classes do 
	get "show_in_view" => "car_classes#show_in_view"
 end

 get "login" => "sessions#new", :as => "login"
 get "logout" => "sessions#destroy", :as => "logout"
 get "signup" => "users#new", :as => "signup"
 
 root :to => 'home#index'
 match "admin" => "home#admin"
 match "admin/reports" => "home#reports"
 match "admin/statistics" => "home#statistics"
 resources :users
 resources :customers
 resources :sessions
 resources :cars do 
	resources :accidents
 end
 resources :bookings do
   get "cancel" => "bookings#cancel", :as => "cancel"
   resources :payements
 end
end

