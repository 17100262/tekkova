class Users::RegistrationsController < Devise::RegistrationsController
  # DELETE /resource
    def create
    build_resource(sign_up_params)
    if User.find_by_email(resource.email).try(:deleted_at) != nil
      resource.errors.add(:base, 'User deleted this account.')
      redirect_to new_user_registration_path, alert: "Seems like you have deactivated your account. You can reactivate your account again using same login details."
    else
      resource.save
      yield resource if block_given?
      
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end
  
  def destroy
    resource.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end
end