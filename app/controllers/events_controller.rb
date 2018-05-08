class EventsController < ApplicationController
    
    def audit
        @events = Event.all
    end
    
    
    private
        
        def event_params
           params.require(:event).permit(:action, :name, :user_id) 
        end
    
end
