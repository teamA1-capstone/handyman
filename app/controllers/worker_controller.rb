class WorkerController < ApplicationController

    def home
        $SWITCH = 0
        render :worker_home
    end

    def worker_profile
        render :worker_profile
    end

    def index
        @worker = Worker.all
        render :worker_directory
    end
    
    def show
        @worker = Worker.find(params[:id])
        render :worker
    end

end
