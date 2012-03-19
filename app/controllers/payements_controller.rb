class PayementsController < ApplicationController

  def index
    @payements = Payement.all
  end

  def show
    @payement = Payement.find(params[:id])
  end

  def new
    @booking = Booking.find_by_id(params[:booking_id])
    @payement = @booking.payements.build
end

  def edit
    @payement = Payement.find(params[:id])
  end
  def create
    @payement = Payement.new(params[:payement])
    @payement.booking_id = params[:booking_id]
    if @payement.save
     redirect_to root_url, notice: 'Payement was successfully created.'
    else
     render action: "new"
    end
  end

  def update
    @payement = Payement.find(params[:id])

    if @payement.update_attributes(params[:payement])
     redirect_to @payement, notice: 'Payement was successfully updated.'
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
