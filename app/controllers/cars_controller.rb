class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = current_user.cars.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = current_user.cars.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:year, :make, :model, :series, :odometer, :trans_mission, :body_type, :color, :fuel_type, :power,:number_of_seats, :drive_type,:description, :liecense_plate_number, :state, :insurance_provider, :pickup_suburb, :pickup_postcode, :pickup_state, :driving_liecense_country,:driving_liecense_state,:driving_liecense_number, :driving_liecense_firstname, :driving_liecense_middlename, :driving_liecense_lastname,:personal_house_number, :personal_street_name, :personal_suburb, :personal_state, :personal_postcode,:personal_dob, :personal_mobile,car_feature_ids:[],images: [],availibility_days: [])
    end
end
