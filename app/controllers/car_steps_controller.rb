class CarStepsController < ApplicationController
    include Wicked::Wizard
    steps :car_details, :car_pictures, :availibility_and_pickup, :driver_liecense, :personal_details
    
    def show
        render_wizard
    end

end
