# frozen_string_literal: true

class HomeController < ApplicationController
  authorize_resource class: false, only: %i[admin mass_email]

  def home; end

  def car_management
    @cars = Car.all
  end

  # def user_management
  # end

  def how_it_works; end

  def policies; end

  def contact_us; end

  def listing_criteria; end

  def terms_and_conditions; end

  def fee_and_charges; end

  def privacy_policy; end

  def nd_policy; end

  def about_us; end

  def admin
    # render :layout => false
    # byebug
  end

  def mass_email; end

  def send_contact_query
    BasicMailer.send_contact_query(params[:name],
                                   params[:email], params[:subject],
                                   params[:message]).deliver_later
    redirect_to root_path, notice: 'Your message has been sent to us.'
  end
end
