class CustomerController < ApplicationController
    before_action :authenticate_customer!, except: [:home]

    def home
        $SWITCH = 1
        render :home
    end

    def customer_profile
        render :customer_profile
    end

    def my_jobs
        @not_started_jobs = current_customer.jobs.where("in_progress = ?", false)
        @in_progress_jobs = current_customer.jobs.where("completed = ? AND in_progress = ?",false, true)
        @completed_jobs = current_customer.jobs.where("completed = ? AND in_progress = ?", true, false)
        render :my_jobs
    end
end
