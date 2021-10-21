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
    @job = @customer.jobs.build(params.require(:job).permit(:name, :description, :speciality))
    if @job.save
      flash[:success] = "New Job Posting added!"
      redirect_to jobs_url
    else
      flash.now[:error] = "Job failed to post"
      render :new
    end
    $SPECIALTY_TYPES.delete_at(0)
  end
end
