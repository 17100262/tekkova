class BasicMailer < ApplicationMailer
    def welcome_email(user)
        @recepient = user
        # if Rails.env.production?
            mail(to: @recepient.email, subject: 'Welcome to Tekkova')
        # end
    end
    def first_car(user)
        @recepient = user
        mail(to: @recepient.email, subject: 'Congratulations!!')
    end
    def send_contact_query(name,email,subject,message)
        @name = name
        @email = email
        @subject = subject
        @message = message
        @admin = User.where(admin: true)&.first
        if @admin.present?
            mail(to: @admin.email, subject: 'New query received!')
        end
    end
end