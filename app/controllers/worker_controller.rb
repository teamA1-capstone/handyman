class WorkerController < ApplicationController

    def home
        $SWITCH = 0
        render :worker_home
    end

end
