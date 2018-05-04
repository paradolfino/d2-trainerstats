class RegistrationsController < ApplicationController
    def new
        flash[:notice] = "You must be an admin to create new users!"
        redirect_to '/' unless user_signed_in? && current_user.role == "admin" 
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to '/'
        end
    end
    
    private
    
        def user_params
           params.require(:user).permit(:fullname, :email) 
        end
end