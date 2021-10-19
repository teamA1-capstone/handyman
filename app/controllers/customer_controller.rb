class CustomerController < ApplicationController

    def home
        render :home
    end

    def customer_profile
        render :customer_profile
    end

    def jobs
        render :jobs
    end

end
