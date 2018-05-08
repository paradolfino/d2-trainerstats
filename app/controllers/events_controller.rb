class EventsController < ApplicationController
    
    
    private
        
        def event_params
           params.require(:event).permit(:action, :name, :user_id) 
        end
    
end
