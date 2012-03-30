class CarsController < ApplicationController

  def index
   if current_user && current_user.is_admin?
    @cars = Car.all
   else
    redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end
  
  def show
   if current_user && current_user.is_admin?
    @car = Car.find(params[:id])
   else
    redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end

  def new
   if current_user && current_user.is_admin?
    @car = Car.new
   else
    redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end

  def edit
   if current_user && current_user.is_admin?
    @car = Car.find(params[:id])
   else
    redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end

  def create
   if current_user && current_user.is_admin?
    @car = Car.new(params[:car])
     if @car.save
      redirect_to @car, notice: 'Car was successfully created.'
     else
      render action: "new"
     end
	else
	 redirect_to root_url, notice: 'Must be logged in as admin!'
	end
  end

  def update
   if current_user && current_user.is_admin?
    @car = Car.find(params[:id])
    if @car.update_attributes(params[:car])
     redirect_to @car, notice: 'Car was successfully updated.'
    else
     render action: "edit"
    end
   else
    redirect_to root_url, notice: 'Must be logged in as admin!' 
   end
  end

  def destroy
   if current_user && current_user.is_admin?
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_url
   else
     redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end
end