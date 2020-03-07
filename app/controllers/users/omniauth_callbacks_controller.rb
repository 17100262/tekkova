class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # You should configure your model like this:
    # devise :omniauthable, omniauth_providers: [:twitter,:facebook,:google_oauth2]

    def facebook
      redirect_to_this = request.env['omniauth.params']['redirect_to']
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.email.present?
            if (@user.persisted?)
            store_location_for(@user,redirect_to_this)
            sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
            set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
            else
            session[:omniauth] = request.env["omniauth.auth"].except("extra")
            redirect_to new_user_registration_url,alert: @user.errors.full_messages.join("\n")
            end
        else
            session[:omniauth] = request.env["omniauth.auth"].except('extra')
            redirect_to new_user_registration_url,alert: "Email can't be blank. Please Provide a valid Email Address."
        end
    end

    def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)

        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.email.present?
            if @user.persisted?
            sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
            set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
            else
            session[:omniauth] = request.env["omniauth.auth"].except(:extra)
            redirect_to new_user_registration_url,alert: @user.errors.full_messages.join("\n")
            end
        else
            session[:omniauth] = request.env["omniauth.auth"].except('extra')
            redirect_to new_user_registration_url,alert: "Email can't be blank. Please Provide a valid Email Address."
        end
    end


    def failure
      redirect_to root_path
    end

  end
