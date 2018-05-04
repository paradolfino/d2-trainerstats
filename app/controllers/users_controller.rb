class UsersController < ApplicationController
    
   def new
       unless user_signed_in? && current_user.role == "admin" redirect_to '/'
   end
end