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
        @not_selected_jobs = current_customer.jobs.where("worker_id = ?", 1)
        @in_progress_jobs = current_customer.jobs.where("completed = ? AND in_progress = ?",false, true)
        @completed_jobs = current_customer.jobs.where("completed = ? AND in_progress = ?", true, false)
        render :my_jobs
    end
end
