class UsersController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
        @users = User.all
    
        respond_to do |wants|
            wants.html # index.html.erb
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            if params[:user][:step] == "1"
                redirect_to driverdetails_path
            elsif params[:user][:step] == "2"
                redirect_to pickupdetails_path
            elsif params[:user][:step] == "3"
                car = current_user.cars.last
                car.update(status: "completed")
                redirect_to car_path(car), notice: "Car Posted Successfully"
            else
                redirect_to user_path, notice: "Profile updated successfully"
            end
        else
            redirect_to edit_user_path, notice: @user.errors.full_messages.join
        end
    end
    
    def delete_commentfile
        @file = CommentFile.find(params[:comment_file_id])
        if @file.present?
           @file.destroy
        end
        redirect_back(fallback_location: users_path)
    end
    
    def my_garage
        @user = current_user
        @cars = current_user.cars 
    end
    
    def my_documents
        @user = current_user
    end
    
    def inbox
        @user = current_user
    end
    
    def my_bookings
        @user = current_user
    end
    
    def my_payments
        @user = current_user
    end
    
    private
    def user_params
        params.require(:user).permit(:firstname, :lastname, :profile_image,:licensefront,:licenseback, :pickup_suburb, :pickup_postcode, :pickup_state, :rental,:advance_notice,:driving_liecense_country,:driving_liecense_state,:driving_liecense_number, :driving_liecense_firstname, :driving_liecense_middlename, :driving_liecense_lastname,:personal_house_number, :personal_street_name, :personal_suburb, :personal_state, :personal_postcode,:personal_dob, :personal_mobile,:step,availibility_days: [], comment_files_attributes: [:id, :file, :user_id, :_destroy])
    end
end
