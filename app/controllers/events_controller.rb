class EventsController < ApplicationController
    
    def audit
        @events = Event.all
    end
    
    def create
       @event = Event.new(event_params) 
    end
    
    
    private
        
        def event_params
           params.require(:event).permit(:action, :content, :user_id) 
        end
    
end
