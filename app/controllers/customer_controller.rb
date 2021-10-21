class CustomerController < ApplicationController

    def home
        $SWITCH = 1
        render :home
    end

    def customer_profile
        render :customer_profile
    end

    def jobs
        @jobs = Job.all
        render :jobs
    end

end
