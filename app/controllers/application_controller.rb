class ApplicationController < ActionController::Base
 #before_filter :restrict_access
 protect_from_forgery
 
 private
 def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end
helper_method :current_user

 #def restricted_access
  #whitelist = [ips go here]
  #unless whitelist.include? request.remote_ip
    #redirect_to root_path, :notice => "Access Denied"
  #end
 #end

end