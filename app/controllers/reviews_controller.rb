class ReviewsController < ApplicationController
    def new
        @job = Job.find(params[:job_id])
        @review = Review.new
        render :new
    end
end
