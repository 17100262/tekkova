class HomeController < ApplicationController
    # authorize_resource :class => false

    def home
    end
    
    def car_management
        @cars = Car.all
    end
    
    # def user_management
    # end

    def how_it_works
    end
    
    def policies
    end
    
    def contact_us
    end 
    
    def admin
        # render :layout => false
        # byebug
    end
    def mass_email
    end
    
end
