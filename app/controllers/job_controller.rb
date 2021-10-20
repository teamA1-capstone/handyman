class JobController < ApplicationController

  def jobs
    @jobs = Job.all
    render :jobs
  end

  def new
    @job = Job.new
    render :new
  end

  def create
    @job = Job.new(params.require(:job).permit(:name, :description, :speciality))
    if @job.save
      flash[:success] = "New Job Posting added!"
      redirect_to jobs_url
    else
      flash.now[:error] = "Job failed to post"
      render :new
    end
  end
end
