class CancellationLogsController < ApplicationController
    
    before_action :set_log, only: [:show, :edit, :destroy]
    before_action :total_cancellations, only: [:index, :inactive]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @logs = CancellationLog.where(active: true).order('id DESC')
        @active = @logs.count
        @total = CancellationLog.all.count
        respond_to do |format|
            format.html
            format.json { json_response(@all_logs)}
        end
        
    end
    
    def inactive
        @logs = CancellationLog.where(active: false).order('id DESC')
        @total = CancellationLog.all.count
        
        respond_to do |format|
            format.html
            format.json { json_response(@all_logs)}
        end
    end
    
    def show
        @users = User.all
        if params[:sort]
            @cancellations = @log.cancellations.where(trainer: params[:sort]).order('id DESC')
        else
            @cancellations = @log.cancellations.order('id DESC')
        end
        @count = @cancellations.count
        
        respond_to do |format|
            format.html
            format.json { 
                    json_response(@log.to_json(:include => [:cancellations]))  
            }
            format.csv { send_data @cancellations.to_csv, filename: "#{@log.title}.csv" }
            format.xls { send_data @cancellations.to_csv(col_sep: "\t"), filename: "#{@log.title}.xls" }
        end
        
        
    end
    
    def new
       @log = Log.new 
    end
    
    def create
        @log = Log.new(params_log)
        if @log.save
            create_event("created", "cancellation log with ID: #{@log.id}, Title: #{@log.title}")
            redirect_to @log
        else
            render 'new'
        end
    end
    
    def edit; end
    
    def update
        
        @log = Log.find(params[:id])
        @old_title = @log.title
        if @log.update(params_log)
            create_event("updated", "log with ID: #{@log.id}, Title: #{@old_title} to (Title: #{@log.title}, Active: #{@log.active})")
            redirect_to logs_path
        else
            render 'edit'
        end
    end
    
    def destroy
        create_event("destroyed", "log with ID: #{@log.id}, Title: #{@log.title}")
        @log.destroy
        redirect_to logs_path
        
    end
    
    private
    
        def set_log
           if Log.where(id: params[:id]).exists?
               @log = Log.find(params[:id])
           else
               not_found
               
           end
        end
        
        def params_log
            params.require(:log).permit(:title, :active) 
        end
        
        def all_cancellations(logs)
            training_arr = []
            logs.each do |l|
                 training_arr.push(l.cancellations.count)
            end
            training_arr.reduce(&:+)
        end
        
        def total_cancellations
            @all_logs = Log.all
            @total_cancellations = all_cancellations(@all_logs)
        end
        
        
end
