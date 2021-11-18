class WorkerController < ApplicationController

    def home
        $SWITCH = 0
        render :worker_home
    end

    def worker_profile
        render :worker_profile
    end

    def index
      # $SPECIALTY_TYPES is a global array populated with every specialty type available.
      # can be found in app/controllers/application_controller.rb
      
      # this is grabbing the extra data passed in the url and converting it to a integer
      @index = params[:specialty_index].to_i

      # -1 is the value passed when clicking the link to view all workers
      if params[:sort] == "first_name"
        @workers_to_display = Worker.order(params[:sort])
      elsif params[:sort] == "last_name"
        @workers_to_display = Worker.order(params[:sort])
      elsif @index != -1
        @workers_to_display = Worker.where({specialty: $SPECIALTY_TYPES.at(@index)})
      else
        @workers_to_display = Worker.all
      end
      
      render :worker_directory
    end
    
    def show
        @worker = Worker.find(params[:id])
        render :worker
    end

end
