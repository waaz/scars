class PayementsController < ApplicationController
  before_filter do
    @booking = Booking.find_by_id(params[:booking_id])
    @car= Car.find_by_id(@booking.car_id)
    @car_class = CarClass.find_by_id(@car.car_class_id)
  end
  def index
    if current_user.is_admin?
      @payements = Payement.all
    end
    if current_user
      @payements = Payement.where("booking_id = ?", @booking.id)
    else
       redirect_to root_url, :notice => "must be logged in to view payments"
    end
  end

  def show
    @payement = @booking.payements.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payement }
    end
  end

  def new
    @payement = @booking.payements.build

  end

  def edit
    @payement = @booking.payements.find(params[:id])
  end
  def create
    @payement = Payement.new(params[:payement])
    @payement.booking_id = params[:booking_id]
    if @payement.save
     redirect_to new_order_path, notice: 'Payement was successfully created.'
    else
     render action: "new"
    end
  end

  def update
    @payement = Payement.find(params[:id])

    if @payement.update_attributes(params[:payement])
     redirect_to booking_payement_url(@payement.booking_id), notice: 'Payement was successfully updated.'
    else
     render action: "edit"
    end
  end

  def destroy
    @payement = Payement.find(params[:id])
    @payement.destroy
    redirect_to payements_url
  end

end
