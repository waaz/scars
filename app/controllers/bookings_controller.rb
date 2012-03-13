class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(params[:booking])
	
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
  
  def update
    @booking = Booking.find(params[:id])

    if @booking.update_attributes(params[:booking])
     redirect_to @booking, notice: 'Booking was successfully updated.'
	else
     render action: "edit"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_url
  end
end