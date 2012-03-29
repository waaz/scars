class AccidentsController < ApplicationController
  # GET /accidents
  # GET /accidents.json
  
    before_filter do
      @car = Car.find(params[:car_id])
    end
	  
  def index
  
  
    @accidents = @car.accidents

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accidents }
    end
  end

  # GET /accidents/1
  # GET /accidents/1.json
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
  def new
    @accident = @car.accidents.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accident }
    end
  end

  # GET /accidents/1/edit
  def edit
    @accident = @car.accidents.find(params[:id])
  end

  # POST /accidents
  # POST /accidents.json
  def create
    @accident = @car.accidents.build(params[:accident])
    
      if @accident.save
        redirect_to admin_path
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
