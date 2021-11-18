class JobController < ApplicationController

  def jobs
    @jobs = Job.all
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
    @job.completed = false
    @job.in_progress = false
    if @job.save
      flash[:success] = "New Job Posting added!"
      redirect_to jobs_url
    else
      flash.now[:error] = "Job failed to post"
      render :new
    end
    $SPECIALTY_TYPES.delete_at(0)
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
