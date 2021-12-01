class JobController < ApplicationController
  
  before_action :authenticate_customer!, except: [:index, :jobs]

  def jobs
    @jobs = Job.where("completed = ? AND in_progress = ?", false, false)
    render :jobs
  end

  def index
    # $SPECIALTY_TYPES is a global array populated with every specialty type available.
    # can be found in app/controllers/application_controller.rb
    
    # this is grabbing the extra data passed in the url and converting it to a integer
    @index = params[:specialty_index].to_i

    # -1 is the value passed when clicking the link to view all workers
    if @index != -1
      @jobs = Job.where("specialty = ? AND completed = ? AND in_progress = ?", $SPECIALTY_TYPES.at(@index), false, false)
    else
      @jobs = Job.where("completed = ? AND in_progress = ?", false, false)
    end
    
    render :jobs
  end

  def new
    @customer = Customer.find(current_customer.id)
    @job = Job.new
    render :new
  end

  def create
    @customer = Customer.find(current_customer.id)
    @job = @customer.jobs.build(params.require(:job).permit(:name, :description, :specialty))
    @job.completed = false
    @job.in_progress = false
    @job.worker = Worker.find(1)
    if @job.save
      flash[:success] = "New Job Posting added!"
      redirect_to jobs_url
    else
      flash.now[:error] = "Job failed to post"
      render :new
    end
  end

  def delete
    @job = Job.find(params[:id])
    @job.destroy
    flash[:success] = "The job has been successfully destroyed."
    redirect_to jobs_path

  end  

  def edit
    @job = current_customer.jobs.find(params[:customer_id])
    render :edit
  end

  def update
    @job = current_customer.jobs.find(params[:customer_id])
    if @job.update(params.require(:job).permit(:name, :description, :specialty))
      flash[:success] = "Job updated successfully"
      redirect_to my_jobs_path
    else
      flash.now[:error] = "Job could not be updated"
      render :edit

    end
  end


  def job_search
    if params[:job_search].blank?
      redirect_to jobs_path(-1)
    else
      @parameter = params[:job_search].downcase
      @jobs = Job.all.where("lower(specialty) LIKE :search", search: "%#{@parameter}%")
    end
  end
  
end
