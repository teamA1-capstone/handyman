class WorkerController < ApplicationController

    before_action :authenticate_worker!, except: [:home, :index, :show, :ratings_index, :search]
    before_action :require_permission, except: [:home, :index, :show, :ratings_index, :search]

    def require_permission
      if current_customer
        redirect_to home_path, flash: { error: "You do not have permission to do that." }
      end
    end

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

      if @not_started_jobs == nil
        @not_started_jobs = []
      end
      if @in_progress_jobs == nil
        @in_progress_jobs = []
      end
      if @completed_jobs == nil
        @completed_jobs = []
      end
        render :worker_jobs
    end

    def job_selection
      @job = Job.find(params[:job_id])
      @job.worker = current_worker
      if @job.save
        flash[:success] = "Job selected!"
        redirect_to worker_jobs_path
      else
        flash[:error] = "Job selection failed."
        redirect_to jobs_url
      end
    end

    def job_remove
      @job = Job.find(params[:job_id])
      @job.worker = Worker.find(1)
      if @job.save
        flash[:success] = "Job removed."
        redirect_to worker_jobs_path
      else
        flash[:error] = "Could not remove job from list"
        redirect_to worker_jobs_path
      end
    end

    def job_start
      @job = Job.find(params[:job_id])
      @job.in_progress = true
      if @job.save
        flash[:success] = "Job started."
        redirect_to worker_jobs_path
      else
        flash[:error] = "Could not start job."
        redirect_to worker_jobs_path
      end
      
    end

    def job_complete
      @job = Job.find(params[:job_id])
      @job.in_progress = false
      @job.save
      @job.completed = true
      if @job.save
        flash[:success] = "Job completed."
        redirect_to worker_jobs_path
      else
        flash[:error] = "Could not complete job"
        redirect_to worker_jobs_path
      end
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
