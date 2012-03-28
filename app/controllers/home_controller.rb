class HomeController < ApplicationController
 def admin
  if not current_user or not current_user.is_admin
   redirect_to root_url, notice: "Must be logged in as admin."
  end
 end
 
  def reports
  end
  
  def statistics
   #params[:name]
   #params[:name2]
   #@stats = Booking.find_by_sql("SELECT * FROM Bookings WHERE date_of_departure > #{Date.today}");
   @stats = Booking.find(:all, :conditions => ['date_of_departure > ? AND date_of_departure < ?', Date.today.beginning_of_week.to_time + 1.hour, Date.today.end_of_week.to_time + 1.hour])
   respond_to do |format|
    format.json  { render :json => @stats }
   end
  end
end