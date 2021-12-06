class CustomerController < ApplicationController
    before_action :authenticate_customer!, except: [:home]

    def home
        if worker_signed_in?
          flash[:alert] = "You Must Sign Out First"
          redirect_back(fallback_location: root_path)
        else
          $SWITCH = 1
          render :home
        end
    end

    def customer_profile
        render :customer_profile
    end

    def my_jobs
        @not_started_jobs = current_customer.jobs.where("completed = ? AND in_progress = ?", false, false)
        @in_progress_jobs = current_customer.jobs.where("completed = ? AND in_progress = ?",false, true)
        @completed_jobs = current_customer.jobs.where("completed = ? AND in_progress = ?", true, false)

        render :my_jobs
    end
end
