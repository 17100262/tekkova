module Bulky
  class MailController < ApplicationController
    def home
    end
    
    def send_mail
      
      p "-------------------------"
      users = params[:mail][:user_ids].reject { |c| c.empty? }
      users.each do |user|
        BasicMailer.send_mail(user,params[:mail][:mail_Template_id],params[:subject]).deliver_later
      end
      
      redirect_to main_app.mass_email_path, notice: 'Mail Sent Successfully'
      p "-------------------------"
    end
  end
end