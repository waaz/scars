class PayementsController < ApplicationController
  before_filter do
    @booking = Booking.find_by_id(params[:booking_id])
    @car= Car.find_by_id(@booking.car_id)
    @car_class = CarClass.find_by_id(@car.car_class_id)
  end
  
  def index
    if current_user && (current_user.is_admin? || @booking.user_id == current_user.id)
      @payements = Payement.where('booking_id = ?', @booking.id)
    else
       redirect_to root_url, :notice => "Must be logged in to view payments."
    end
  end

  def new
    @booking_duration = (((@booking.date_of_arrival) - (@booking.date_of_departure)).to_i) / 60 / 60 / 24
    @total_cost = @booking_duration * @car_class.tarrif
    @deposit = @total_cost*0.1
    @final_payment = @total_cost - @deposit
    @payement = @booking.payements.build
	
	@payments = Payement.find(:all,
                :select => "SUM(amount) as paid",
                :group => "booking_id",
				:conditions => ["booking_id = ?", @booking.id])
	
	unless @payments.empty?
	 @remaining_balance = @total_cost - @payments.first.paid
	else
	 @remaining_balance = @total_cost
	end
  end
  
  def create
    @payement = Payement.new(params[:payement])
	@payement.booking_id = @booking.id
    @payement.ip_address = request.remote_ip
    
	if @payement.save
      redirect_to booking_payement_path
    else
      render :action => 'new'
    end
  end

  def update
    @payement = Payement.find(params[:id])

    if @payement.update_attributes(params[:payement])
     redirect_to booking_payement_url(@payement), notice: 'Payement was successfully updated.'
    else
     render action: "edit"
    end
  end
end