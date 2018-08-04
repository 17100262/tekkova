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
end
