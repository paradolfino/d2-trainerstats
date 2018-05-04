class UsersController < ApplicationController
    def new
        redirect_to '/' unless user_signed_in? && current_user.role == "admin" 
        @user = User.new
    end
end