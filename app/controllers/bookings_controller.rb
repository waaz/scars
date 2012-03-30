class BookingsController < ApplicationController
  
  #this action sets instance variable @bookings either to all bookings or to all bookings for a specific individual 
  # depending on admin rights 
  def index
    if current_user
       if current_user.is_admin? #if current user is admin 
         @bookings = Booking.all# show all bookings
       else
         @bookings = Booking.where("user_id = ?", current_user.id) # the bookkings for a specific user 
       end
    else
     redirect_to root_url, notice: 'access denied'
    end
  end
	
  #this action sets the instance variable @booking to a single booking
  def show
    if current_user
	  @booking = Booking.find(params[:id])
      
	  if current_user.is_admin? || (current_user.id == @booking.user_id) #if admin or user requesting own bookings
        render 'show'
      else
        redirect_to :back, notice: 'access denied.'
      end
    else
      redirect_to :back, notice: 'must be logged in'
    end
  end

  #this action generates a new booking instance
  def new  
   if current_user
     @booking = Booking.new
   else
     redirect_to root_url, notice: 'Must be logged in to create booking.'
   end
  end
  
  #this action finds the requested booking then generates a form view for editing the booking
  def edit
    @bookings = Booking.find(params[:id])
    if current_user
      if current_user.is_admin? || current_user.id == @bookings.user_id #if current user is admin or current 
       @booking = Booking.find(params[:id])                             #user is requesting own booking
      else
       redirect_to root_url, notice: 'Not Authorized: must be admin.'
      end
    else
      redirect_to new_user_path
    end
  end
  
  #save booking to database if valid 
  def create
   if current_user #
    @booking = Booking.new(params[:booking]) #save booking to database
	  @cars = Car.where("car_class_id = ?", @booking.car_class) #instance variable @cars is set to all cars of the chosen class

    @cars.each do |c|
	   @bookings = Booking.where("car_id = ?", c.id).where("(status IS NULL) AND ((:start_date >= date_of_departure AND :start_date <= date_of_arrival) OR (:end_date >= date_of_departure AND :end_date <= date_of_arrival))",
      {:start_date => @booking.date_of_departure, :end_date => @booking.date_of_arrival}) #checks which cars are available for given dates
	   if @bookings.empty?
	    @booking.car_id = c.id #set car_id to id car
	    break
	   end
	  end
	
	  if @booking.car_id == nil #if no car has been assigned to booking
      redirect_to new_booking_path, notice: 'Selected car class not available for selected dates.'
	  else
	   @booking.user_id = current_user.id #user_id is set to that of the current user of the system
     if @booking.save
      redirect_to new_booking_payement_path(@booking.id) #redirect to payment path
	   else
      render action: "new"
     end
    end
   end
  end

  #save updated booking to the 
  def update
    @booking = Booking.find(params[:id]) #find current booking
    if current_user
     if  current_user.id == @booking.user_id || current_user.is_admin #only admins and owner of booking can edit the booking
      if @booking.update_attributes(params[:booking])
       redirect_to @booking, notice: 'Booking was successfully updated.'
	    else
       render action: "edit"
      end
     else
      redirect_to :back, notice: 'access denied'
     end
    else
      redirect_to :back,notice: 'must be logged in'
    end
  end
  
  #destroy a booking
  def destroy 
    if current_user && current_user.is_admin?
     @booking = Booking.find(params[:id])
     @booking.destroy
     redirect_to bookings_url
    else
      redirect_to bookings_url, notice: 'Access Denied: Admin Only!!'
    end
  end
  
  #cancel a booking
  def cancel
    @booking = Booking.find(params[:booking_id])
    if current_user.id == @booking.user_id || current_user.is_admin
      @booking.update_attribute(:status, 'cancel')
      redirect_to bookings_url, notice: 'Booking cancelled successfully'
    else 
      redirect_to bookings_url, notice: 'you do not have permission to cancel this booking'
    end
  end 
end