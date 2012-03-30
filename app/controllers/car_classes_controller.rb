class CarClassesController < ApplicationController
  	#admin rights 
    before_filter do
	  if !(current_user.is_admin?)
		redirect_to root_url
	  end
    end 	
  
  #dispaly all car_classes  
  def index
   @car_classes = CarClass.all
  end
  
  #show car_class
  def show
    respond_to do |format|
     format.html { @car_class = CarClass.find(params[:id]) }
	 format.json { render :json => CarClass.find(params[:id]) }
	end
  end
  
  #new car class
  def new
    if current_user && current_user.is_admin?
     @car_class = CarClass.new
	else
	 redirect_to root_url, notice: 'Must be logged in as admin!'
	end
  end
  
  #edit car class
  def edit
   if current_user && current_user.is_admin?
    @car_class = CarClass.find(params[:id])
   else
     redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end
  
  #save accident to database
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
  
  #update database
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
  
  #destroy car_class
  def destroy
   if current_user && current_user.is_admin?
    @car_class = CarClass.find(params[:id])
    @car_class.destroy
	redirect_to car_classes_url
   else
    redirect_to root_url, notice: 'Must be logged in as admin!'
   end
  end    
end