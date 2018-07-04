class CarFeaturesController < ApplicationController
  before_action :set_car_feature, only: [:show, :edit, :update, :destroy]

  # GET /car_features
  # GET /car_features.json
  def index
    @car_features = CarFeature.all
  end

  # GET /car_features/1
  # GET /car_features/1.json
  def show
  end

  # GET /car_features/new
  def new
    @car_feature = CarFeature.new
  end

  # GET /car_features/1/edit
  def edit
  end

  # POST /car_features
  # POST /car_features.json
  def create
    @car_feature = CarFeature.new(car_feature_params)

    respond_to do |format|
      if @car_feature.save
        format.html { redirect_to @car_feature, notice: 'Car feature was successfully created.' }
        format.json { render :show, status: :created, location: @car_feature }
      else
        format.html { render :new }
        format.json { render json: @car_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_features/1
  # PATCH/PUT /car_features/1.json
  def update
    respond_to do |format|
      if @car_feature.update(car_feature_params)
        format.html { redirect_to @car_feature, notice: 'Car feature was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_feature }
      else
        format.html { render :edit }
        format.json { render json: @car_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_features/1
  # DELETE /car_features/1.json
  def destroy
    @car_feature.destroy
    respond_to do |format|
      format.html { redirect_to car_features_url, notice: 'Car feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_feature
      @car_feature = CarFeature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_feature_params
      params.require(:car_feature).permit(:name)
    end
end
