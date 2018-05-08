class EventsController < ApplicationController
    
    def audit
        
    end
    
    
    private
        
        def event_params
           params.require(:event).permit(:action, :name, :user_id) 
        end
    
end
