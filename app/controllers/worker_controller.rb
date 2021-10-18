class WorkerController < ApplicationController

    def home
        render :worker_home
    end

    def worker_profile
        render :worker_profile
    end

end
