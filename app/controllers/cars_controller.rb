class CarsController < ApplicationController
  # before_action :listing_criteria,only: [:new]
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  
  


  # GET /cars
  # GET /cars.json
  def index
    redirect_to root_url
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
  
  def listing_criteria
    render 'cars/listing_criteria'
  end
  def submit_listing_criteria
    if params[:model_year_check]=="1" and params[:usage_limit_check]=="1" and params[:register_check]=="1" and params[:road_worthy_check]=="1" and params[:write_off_check]=="1" and params[:maintained_check]=="1"
      render 'cars/new'
    else
      
    end
  end
  
  def car_steps
    @car = Car.find(params[:id])
    case params[:step]
    when "0"
      render 'cars/car_form_steps/_listing_criteria'
    when "1"
      render 'cars/car_form_steps/_1_car_details',locals: { scenario: "new"}
    when "2"
      render 'cars/car_form_steps/_2_car_pictures'
    when "3"
      render 'cars/car_form_steps/_3_car_preference'
    end
    
    # render 'cars/car_form_steps/_2_car_pictures.html.erb'
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = current_user.cars.new(car_params)
    8.times{ @car.car_pictures.build} if @car.car_pictures.blank?
    
      respond_to do |format|
        if @car.save
          # @car.steps
          step = params[:car][:step].to_i + 1
          if step >= 4
            format.html { redirect_to @car, notice: 'Car Details were successfully saved.' }
          else
            format.html { redirect_to car_steps_path(step: step, id: @car.id) }
          end
          # format.html { redirect_to car_steps_path(step: step, id: @car.id) }
          format.json { render :show, status: :created, location: @car }
        else
          format.html { render @car.car_form_partial }
          format.json { render json: @car.errors, status: :unprocessable_entity }
        end
      end
      # save as published
    # end

    
  end
  
  def research
    @user = current_user
  end

  def personaldetails
    @user = current_user
  end
  def driverdetails
    @user = current_user
  end
  def pickupdetails
    @user = current_user
  end
  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def carshow
    @car = Car.find(params[:car_id])
  end
  def update
    respond_to do |format|
      if @car.update(car_params)
        step = params[:car][:step].to_i + 1
        if step >= 4
          if current_user.cars.count < 2
            BasicMailer.first_car(@car.user).deliver_later
            format.html { redirect_to personaldetails_path }
          else
            format.html { redirect_to @car, notice: 'Car Details were successfully saved.' }
          end
        else
          format.html { redirect_to car_steps_path(step: step, id: @car.id) }
        end
        
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render @car.car_form_partial }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to my_garage_path, notice: 'You have deleted the selected car.' }
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
      params.require(:car).permit(:status,:model_year_check, :usage_limit_check, :register_check, :road_worthy_check, :write_off_check, :maintained_check,:step,:year, :make, :model, :series, :odometer, :trans_mission, :body_type, :color, :fuel_type, :power,:number_of_seats, :drive_type,:description, :liecense_plate_number, :state, :insurance_provider,:agreed_insurance_value,:allow_personal_commercial_use,:daily_drive_limit,:cylinders,:engine_size,car_feature_ids:[],car_pictures_attributes: [:avatar,:_destroy,:id,:position,:delete_picture])
    end
end
