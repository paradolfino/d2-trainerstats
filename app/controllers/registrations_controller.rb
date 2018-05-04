class RegistrationsController < ApplicationController
    def new
        flash[:notice] = "You must be an admin to create new users!"
        redirect_to '/' unless user_signed_in? && current_user.role == "admin" 
        @user = User.new
    end
    
    def create
       @user = User.new(params)
       sql = "insert into users (name,email, created_at,updated_at) values( 
        #{ActiveRecord::Base.connection.quote(user_params[:fullame])}, 
        #{ActiveRecord::Base.connection.quote(user_params[:email])},now(), now())"
      ActiveRecord::Base.connection.execute(sql)
      redirect_to action: 'index'
    end
end