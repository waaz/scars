class HomeController < ApplicationController
 def admin
  if not current_user or not current_user.is_admin
   redirect_to root_url, notice: "Must be logged in as admin."
  end
 end
 
  def reports
  end
  
  def statistics
   @stats = Booking.find(:all,
   :select => 'count(*) count, car_id, car_class_id',
   :group => 'car_class_id',
   :joins => :car,
   :conditions => ['(bookings.status IS NULL) AND date_of_departure > ? AND date_of_departure < ? ', Date.today.beginning_of_week.to_time + 1.hour, Date.today.end_of_week.to_time + 1.hour])
   
   @data = Hash.new
   @stats.each do |s|
    details = CarClass.find(s.car_class_id)
    @data[details.car_class_name] = s.count
   end
   
   respond_to do |format|
    format.json  { render :json => @data }
   end
  end
end