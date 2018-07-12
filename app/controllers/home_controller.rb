class HomeController < ApplicationController
    before_action :authenticate_user!
    def home
    end

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
end
