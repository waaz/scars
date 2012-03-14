class BookingsController < ApplicationController
  def index

   if current_user
       if current_user.is_admin?
         @bookings = Booking.all
       else
         @bookings = Booking.where("user_id = ?", current_user.id)
       end
    else
     redirect_to :back, notice: 'access denied'
   end
  end

  def show

    if current_user
      if current_user.is_admin || current_user.id == params[:id]
        @bookings = Booking.find(params[:id])
      else
        redirect_to :back, notice: 'access denied.'
      end
    else
      redirect_to :back, notice: 'must be logged in'
    end
  end

  def new
   if current_user
     @booking = Booking.new

   else
     redirect_to root_url, notice: 'Must be logged in to create booking.'
   end
  end

  def edit
    @bookings = Booking.find(params[:id])
    if current_user
      if current_user.is_admin? || current_user.id == @bookings.user_id
       @booking = Booking.find(params[:id])
      else
       redirect_to root_url, notice: 'Not Authorized: must be admin.'
      end
    else
      redirect_to new_user_path
    end
  end

  def create
    if current_user
     @booking = Booking.new(params[:booking])
     @cars = Car.all
	
<<<<<<< HEAD
	   @cars.each do |c|
	    @bookings= Booking.where(:car_id, c.id).where(:date_of_departure => (params[:booking][:date_of_departure].to_date)..(params[:booking][:date_of_arrival].to_date))
	    if @bookings.empty?
	     @booking.car_id = c.id
	     break
	    end
	   end
	   @booking.user_id = current_user.id
     if @booking.save
      redirect_to new_payement_url, notice: 'Booking was successfully created.'
	   else
      render action: "new"
     end
    else
      redirect_to root_url, notice: 'logged in'
    end
end
=======
	@cars = Car.where("car_class_id = ?", @booking.car_class)
	
	@cars.each do |c|
	 @bookings = Booking.where("car_id = ?", c.id).where("(:start_date >= date_of_departure AND :start_date <= date_of_arrival) OR (:end_date >= date_of_departure AND :end_date <= date_of_arrival)",
  {:start_date => @booking.date_of_departure, :end_date => @booking.date_of_arrival})
	 if @bookings.empty?
	  @booking.car_id = c.id
	  break
	 end
	end
	
	if @booking.car_id == nil
	 redirect_to new_booking_path, notice: 'Selected car class not available for selected dates.'
	else
	
     if @booking.save
      redirect_to new_payement_url, notice: 'Booking was successfully created.'
	 else
      render action: "new"
     end
	end
  end
  
>>>>>>> 5de0fbe71f159cf1eebd2a08959acac6bd433541
  def update
    @booking = Booking.find(params[:id])

    if current_user
     if  current_user.id == @booking.user_id || current_user.is_admin
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
  def destroy
    if current_user && current_user.is_admin?
     @booking = Booking.find(params[:id])
     @booking.destroy
     redirect_to bookings_url
    else
      redirect_to bookings_url, notice: 'Access Denied: Admin Only!!'
    end
  end

end
