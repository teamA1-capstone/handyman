class ReviewsController < ApplicationController
    def index
        @index = params[:specialty_index].to_i

        @worker = Worker.find(params[:id])
        @job = @worker.jobs
        
        @job.each_with_index do |job, index|
            if(job.reviews) != nil 
                @reviews = job.reviews
            end
        end

        render :index
    end

    def new
        @job = Job.find(params[:job_id])
        @review = Review.new
        render :new
    end

    def create
        @job = Job.find(params[:job_id])
        @review = Review.new(params.require(:review).permit(:skill_rating,:reliability_rating,:focused_rating,:honesty_rating,:headline,:body, {pictures: []}))
        @review.job = @job
        if @review.save
            flash[:success] = "Review creation successful"
            redirect_to my_jobs_path
        else
            flash.now[:error] = "Question could not be saved"
            render :new
        end
    end
end
