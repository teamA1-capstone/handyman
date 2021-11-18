class ReviewsController < ApplicationController
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
