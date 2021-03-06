class Users::SessionsController < Devise::SessionsController
  
  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user.present? && user.deleted_at != nil
      user.update(deleted_at: nil)
      flash[:notice]= " welcome back, You have successfully reactivated your account."
      sign_in(User, user)
      redirect_to user_path(user)
    else
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end
  
  
end