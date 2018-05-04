class RegistrationsController < ApplicationController
    def new
        flash[:notice] = "You must be an admin to create new users!"
        redirect_to '/' unless user_signed_in? && current_user.role == "admin" 
        @user = User.new
    end
    
    def create
       @user = User.new(params) 
    end
end