class AccidentsController < ApplicationController
  # GET /accidents
  # GET /accidents.json
	
	#admin rights 
    before_filter do
      @car = Car.find(params[:car_id])
	  if !(current_user.is_admin?)
		redirect_to root_url
	  end
    end
  
  #all accidents linked to car  
  def index
  
  
    @accidents = @car.accidents

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accidents }
    end
  end

  #show one payment
  def show
    @accident = @car.accidents.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accident }
	  format.pdf { render :layout => false }
    end
  end

  # GET /accidents/new
  # GET /accidents/new.json
  #generate new accident
  def new
    @accident = @car.accidents.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accident }
    end
  end

  # GET /accidents/1/edit
  #edit accident
  def edit
    @accident = @car.accidents.find(params[:id])
  end

  # POST /accidents
  # POST /accidents.json
  def create
    @accident = @car.accidents.build(params[:accident])
    
      if @accident.save
        redirect_to admin_path, notice: "accident report submittdd"
	  else
		redirect_to new_car_accident_path(@car,@accident)
      end
	  

  end

  # PUT /accidents/1
  # PUT /accidents/1.json
  def update
    @accident = Accident.find(params[:id])
      if @accident.update_attributes(params[:accident])
         redirect_to cars_url
      else
        format.html { render action: "edit" }
        format.json { render json: @accident.errors, status: :unprocessable_entity }
      end
  end

  # DELETE /accidents/1
  # DELETE /accidents/1.json
  def destroy
    @accident = Accident.find(params[:id])
    @accident.destroy
    
	redirect_to cars_url, notice: "car destroyed"
  end

end
