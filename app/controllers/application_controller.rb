class ApplicationController < ActionController::Base
    include Response
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user
    
    def not_found
        redirect_to '/public/404.html'
    end

    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
        devise_parameter_sanitizer.permit(:edit, keys: [:fullname])
    end
end
