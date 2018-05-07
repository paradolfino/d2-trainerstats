class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin, only: [:new, :index]
    
    def index
        
    end
    
    def new
        @user = User.new
        require_admin
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to '/'
        end
    end
    
    private
    
        def user_params
           params.require(:user).permit(:fullname, :email, :password, :password_confirmation) 
        end
end