class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :require_admin, only: [:new, :index, :destroy]
    
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to '/'
        end
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        @user.destroy
        redirect_to '/admin/users'
    end
    
    private
    
        def set_user
           @user = User.find(params[:id]) 
        end
    
        def user_params
           params.require(:user).permit(:fullname, :email, :password, :password_confirmation) 
        end
end