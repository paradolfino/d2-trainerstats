class LogsController < ApplicationController
    
    def index
        @logs = Log.all
    end
    
    def show
        
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        
    end
    
    private
        
        def params_log
            params.require(:log).permit(:title, :active) 
        end
end
