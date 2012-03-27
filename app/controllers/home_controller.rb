class HomeController < ApplicationController
 def admin
  if not current_user or not current_user.is_admin
   redirect_to root_url, notice: "Must be logged in as admin."
  end
 end
 
  def reports

  end
  
  def statistics
 @stats = User.all

  respond_to do |format|
    format.json  { render :json => @stats }
  end
  end
end
