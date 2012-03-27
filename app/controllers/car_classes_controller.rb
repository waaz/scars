class CarClassesController < ApplicationController

  def index
    if current_user && current_user.is_admin?
     @car_classes = CarClass.all
	else
	 redirect_to root_url, notice: 'Must be logged in as admin!'
	end
  end

  def show
   if current_user && current_user.is_admin?
    @car_class = CarClass.find(params[:id])
   else
    redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end
  
  def new
    if current_user && current_user.is_admin?
     @car_class = CarClass.new
	else
	 redirect_to root_url, notice: 'Must be logged in as admin!'
	end
  end
  
  def edit
   if current_user && current_user.is_admin?
    @car_class = CarClass.find(params[:id])
   else
     redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end

  def create
   if current_user && current_user.is_admin?
    @car_class = CarClass.new(params[:car_class])
    if @car_class.save
     redirect_to @car_class, notice: 'Car class was successfully created.'
    else
     render action: "new"
    end
   else
    redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end
  
  def update
   if current_user && current_user.is_admin?
    @car_class = CarClass.find(params[:id])
    if @car_class.update_attributes(params[:car_class])
     redirect_to @car_class, notice: 'Car class was successfully updated.'
    else
	   format.html { render action: "edit" }
    end
   else
    redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end
  
  def destroy
   if current_user && current_user.is_admin?
    @car_class = CarClass.find(params[:id])
    @car_class.destroy
	redirect_to car_classes_url
   else
    redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end
  
  def show_in_view
   @car_class = CarClass.find(params[:id])
   format.html{render action "show", :layout => false}
   
  end
    
end