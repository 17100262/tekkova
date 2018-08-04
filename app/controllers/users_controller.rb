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
            redirect_to user_path, notice: "User profile updated successfully"
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
    private
    def user_params
        params.require(:user).permit(:name, :username, :profile_image, :comment, :phone_number,:identifier,:company_name,:linkedin_link,:githhub_link,:website_link,:portfolio,:other_link1,:other_link2,:other_link3,:experience, comment_files_attributes: [:id, :file, :user_id, :_destroy])
    end
end
