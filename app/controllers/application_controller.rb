class ApplicationController < ActionController::Base
    include Response
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def not_found
        redirect_to '/public/404.html'
    end

    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
    end
end
