class HomeController < ApplicationController
 def admin
  if not current_user or not current_user.is_admin
   redirect_to root_url, notice: "Must be logged in as admin."
  end
 end
end
