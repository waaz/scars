class CarClassesController < ApplicationController

  def index
    @car_classes = CarClass.all
  end

  def show
    @car_class = CarClass.find(params[:id])
  end
  
  def new
    @car_class = CarClass.new
  end
  
  def edit
    @car_class = CarClass.find(params[:id])
  end

  def create
    @car_class = CarClass.new(params[:car_class])
    if @car_class.save
     redirect_to @car_class, notice: 'Car class was successfully created.'
    else
     render action: "new"
    end
  end
  
  def update
    @car_class = CarClass.find(params[:id])
    if @car_class.update_attributes(params[:car_class])
     redirect_to @car_class, notice: 'Car class was successfully updated.'
    else
	 format.html { render action: "edit" }
    end
  end
  
  def destroy
    @car_class = CarClass.find(params[:id])
    @car_class.destroy
	redirect_to car_classes_url
  end
end