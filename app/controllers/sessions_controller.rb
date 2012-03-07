class SessionsController < ApplicationController
 def create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
   session[:user_id] = user.id
   redirect_to root_url
  else
   redirect_to root_url, notice: "Invalid email or password."
  end
 end

 def destroy
  if current_user
   session[:user_id] = nil
   redirect_to root_url, notice: "Logged out."
  else
   redirect_to root_url, notice: "Not logged in."
  end
 end
end
