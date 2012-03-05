class CarClassesController < ApplicationController
  # GET /car_classes
  # GET /car_classes.json
  def index
    @car_classes = CarClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @car_classes }
    end
  end

  # GET /car_classes/1
  # GET /car_classes/1.json
  def show
    @car_class = CarClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car_class }
    end
  end

  # GET /car_classes/new
  # GET /car_classes/new.json
  def new
    @car_class = CarClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @car_class }
    end
  end

  # GET /car_classes/1/edit
  def edit
    @car_class = CarClass.find(params[:id])
  end

  # POST /car_classes
  # POST /car_classes.json
  def create
    @car_class = CarClass.new(params[:car_class])

    respond_to do |format|
      if @car_class.save
        format.html { redirect_to @car_class, notice: 'Car class was successfully created.' }
        format.json { render json: @car_class, status: :created, location: @car_class }
      else
        format.html { render action: "new" }
        format.json { render json: @car_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /car_classes/1
  # PUT /car_classes/1.json
  def update
    @car_class = CarClass.find(params[:id])

    respond_to do |format|
      if @car_class.update_attributes(params[:car_class])
        format.html { redirect_to @car_class, notice: 'Car class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @car_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_classes/1
  # DELETE /car_classes/1.json
  def destroy
    @car_class = CarClass.find(params[:id])
    @car_class.destroy

    respond_to do |format|
      format.html { redirect_to car_classes_url }
      format.json { head :no_content }
    end
  end
end
