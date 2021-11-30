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
        @workers_to_display = Worker.where({invisibility: 0}).order(params[:sort]) 
      elsif params[:sort] == "last_name"
        @workers_to_display = Worker.where({invisibility: 0}).order(params[:sort])
      elsif @index != -1
        @workers_to_display = Worker.where({specialty: $SPECIALTY_TYPES.at(@index)})
      else
        @workers_to_display = Worker.where({invisibility: 0})
      end
      
      render :worker_directory
    end
    
    def show
        @worker = Worker.find(params[:id])
        render :worker
    end

    def search
        if params[:search].blank?
          redirect_to worker_directory_path(-1)
        else
          # @results returns searches done for first name or last name or the specialty
          # of the worker
          @parameter = params[:search].downcase
          @results = Worker.all.where("lower(first_name) LIKE :search", search: "%#{@parameter}%")
          @results += Worker.all.where("lower(last_name) LIKE :search", search: "%#{@parameter}%")
          @results += Worker.all.where("lower(specialty) LIKE :search", search: "%#{@parameter}%")
        end
    end

    def ratings_index
      @filter_value = params[:review_value].to_i
      @workers_to_display = []
      @index = 0
      Worker.all.each_with_index do |w|
        if w.rating == @filter_value
          @workers_to_display[@index] = w
          @index = @index + 1
        end
      end
      
      render :worker_directory
    end

end
