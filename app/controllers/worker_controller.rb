class WorkerController < ApplicationController

    before_action :authenticate_worker!, except: [:home, :index]

    def home
        $SWITCH = 0
        render :worker_home
    end

    def worker_profile
        render :worker_profile
    end

    def worker_jobs
      @not_started_jobs = current_worker.jobs.where("in_progress = ?", false)
      @in_progress_jobs = current_worker.jobs.where("completed = ? AND in_progress = ?",false, true)
      @completed_jobs = current_worker.jobs.where("completed = ? AND in_progress = ?", true, false)
      render :worker_jobs
    end

    def job_selection
      @job = Job.find(params[:job_id])
      @job.worker = current_worker
      if @job.save
        flash[:success] = "Job selected!"
        render :worker_profile
      else
        flash[:error] = "Job selection failed."
        redirect_to jobs_url
      end
    end

    def job_remove
      @job = Job.find(params[:job_id])
      @job.worker = worker.find(1)
      @job.save
    end

    def job_start
      @job = Job.find(params[:job_id])
      @job.in_progress = true
      @job.save
      render :worker_jobs
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

end
