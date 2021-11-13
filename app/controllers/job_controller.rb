class JobController < ApplicationController

  def jobs
    @jobs = Job.all
    render :jobs
  end

  def index
    # $SPECIALTY_TYPES is a global array populated with every specialty type available.
    # can be found in app/controllers/application_controller.rb
    
    # this is grabbing the extra data passed in the url and converting it to a integer
    @index = params[:specialty_index].to_i

    # -1 is the value passed when clicking the link to view all workers
    if @index != -1
      @jobs = Job.where({specialty: $SPECIALTY_TYPES.at(@index)})
    else
      @jobs = Job.all
    end
    
    render :jobs
  end

  def new
    @customer = Customer.find(current_customer.id)
    @job = Job.new
    $SPECIALTY_TYPES.prepend("select")
    render :new
  end

  def create
    @customer = Customer.find(current_customer.id)
    @job = @customer.jobs.build(params.require(:job).permit(:name, :description, :specialty))
    if @job.save
      flash[:success] = "New Job Posting added!"
      redirect_to jobs_url
    else
      flash.now[:error] = "Job failed to post"
      render :new
    end
    $SPECIALTY_TYPES.delete_at(0)
  end

  def index
    # $SPECIALTY_TYPES is a global array populated with every specialty type available.
    # can be found in app/controllers/application_controller.rb
    
    # this is grabbing the extra data passed in the url and converting it to a integer
    @index = params[:specialty_index].to_i

    # -1 is the value passed when clicking the link to view all jobs
    if @index != -1
      @jobs = Job.where({specialty: $SPECIALTY_TYPES.at(@index)})
    else
      @jobs = Job.all
    end
    
    render :jobs
  end

  def delete
    @job = Job.find(params[:id])
    @job.destroy
    flash[:success] = "The job has been successfully destroyed."
    redirect_to jobs_path

  end  


  def my_jobs
    @jobs = current_customer.jobs
    render :my_jobs
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
end
