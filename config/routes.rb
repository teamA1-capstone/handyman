Rails.application.routes.draw do
  
  as :customers do
    root to: 'customer#home', as: 'customer_root'
  end

  as :workers do
    root to: 'worker#home', as: 'worker_root'
  end

  devise_for :workers
  devise_for :customers
  
  root to: redirect('/home')

  get 'home', to: 'customer#home', as: 'home'
  get 'home/customer-profile', to: 'customer#customer_profile', as: 'customer_profile'
  
  get '/customer/customer-profile/my-jobs/', to: 'customer#my_jobs', as: 'my_jobs'
  get '/customer/customer-profile/my-jobs/edit/:customer_id', to: 'job#edit', as: 'edit'
  patch '/customer/customer-profile/my-jobs/:customer_id', to: 'job#update', as: 'update_job'
  put '/customer/customer-profile/my-jobs/:customer_id', to: 'job#update'

  post '/customer/customer-profile/my-jobs/:job_id', to: 'reviews#create', as: 'create_review'
  get '/customer/customer-profile/my-jobs/:job_id/new-review', to: 'reviews#new', as: 'new_review'

  get '/home/jobs', to: 'job#jobs', as: 'jobs'
  get '/home/jobs/select/:job_id', to: 'worker#job_selection', as: 'job_selection'
  
  post '/home/jobs', to: 'job#create'
  get '/home/jobs/new', to: 'job#new', as: 'new_job'

  get 'home/jobs/:specialty_index', to: 'job#index', as: 'job_type'
  
  delete '/home/jobs/:id', to: 'job#delete', as: 'delete_job'
  
  get 'home/worker', to: 'worker#home', as: 'worker_home'
  get 'home/worker/worker-profile', to: 'worker#worker_profile', as: 'worker_profile'
  get 'home/worker/worker-profile/my-jobs', to: 'worker#worker_jobs', as: 'worker_jobs'
  get 'home/worker/worker-profile/my-jobs/:job_id/start', to: 'worker#job_start', as: 'job_start'
  get 'home/worker/worker-profile/my-jobs/:job_id/remove', to: 'worker#job_remove', as: 'job_remove'

  get 'home/worker-directory/:specialty_index', to: 'worker#index', as: 'worker_directory'
  get 'home/worker-directory/:specialty_index/:id', to: 'worker#show', as: 'worker'

  get '/search', to: 'worker#search'
  get '/job_search', to: 'job#job_search'

  get 'home/worker-directory/:specialty_index/:id/worker-reviews', to: 'reviews#index', as: 'worker_reviews'
  get 'home/worker-directory/:specialty_index/:id/worker-reviews/:review_id', to: 'reviews#show', as: 'review'

end
