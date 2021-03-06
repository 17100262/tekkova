# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[engine_policy cleaning_policy
                                                feul_policy infringements_policy
                                                infringements_policy
                                                late_return_policy sign_up_page]
  load_and_authorize_resource except: [:sign_up_page]

  def index
    @users = User.where.not(email: current_user.email).where(deleted_at: nil)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.soft_delete
      redirect_back(fallback_location: root_url, notice: 'account successfully deleted')
    else
      redirect_back(fallback_location: root_url, alert: 'Something went wrong, Please try again later.')
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    changed_fields = @user.changed
    if @user.save!
      if current_user.admin
        redirect_to users_path, notice: 'successfully updated'
      else
        if params[:user][:step] == '1'
          redirect_to driverdetails_path
        elsif params[:user][:step] == '2'
          redirect_to pickupdetails_path
        elsif params[:user][:step] == '3'
          redirect_to research_path
        elsif params[:user][:step] == '4'
          car = current_user.cars.last
          car.update(status: 'completed')
          redirect_to car_path(car), notice: 'Car Posted Successfully'
        else
          redirect_to user_path, notice: (if changed_fields.include?('licenseback_updated_at')
                                            'You have successfully added photos of your licence'
                                            end) || 'You have successfully updated your details'
          end
      end
    else
      redirect_to edit_user_path, notice: @user.errors.full_messages.join
    end
  end

  def delete_commentfile
    @file = CommentFile.find(params[:comment_file_id])
    @file.destroy if @file.present?
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

  def my_ratings
    @user = current_user
  end

  def my_handover
    @user = current_user
  end

  def cleaning_policy; end

  def engine_policy; end

  def feul_policy; end

  def infringements_policy; end

  def late_return_policy; end

  def sign_up_page; end

  def upload_documents
    @upload = UserDocument.create!(user: current_user, file: params[:upload])
  end

  def delete_document
    @document = UserDocument.find(params[:document_id])
    @success = @document&.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :profile_image,
                                 :licensefront, :licenseback, :pickup_suburb,
                                 :pickup_postcode, :pickup_state, :rental,
                                 :advance_notice, :driving_liecense_country,
                                 :driving_liecense_state,
                                 :driving_liecense_number,
                                 :driving_liecense_firstname,
                                 :driving_liecense_middlename,
                                 :driving_liecense_lastname,
                                 :personal_house_number, :personal_street_name,
                                 :personal_suburb,
                                 :personal_state, :personal_postcode,
                                 :personal_dob, :personal_mobile,
                                 :comment, :step, :offers, :home_phone_number,
                                 :research,
                                 availibility_days: [],
                                 comment_files_attributes: %i[id file user_id _destroy])
  end
end
