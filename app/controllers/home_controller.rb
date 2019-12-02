class HomeController < ApplicationController
    authorize_resource :class => false,only: [:admin, :mass_email]

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
    def listing_criteria
    end
    def terms_and_conditions
    end
    def fee_and_charges
    end
    def privacy_policy
    end
    def nd_policy
    end
    def about_us
    end
    def admin
        # render :layout => false
        # byebug
    end
    def mass_email
    end


    
end
