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
  get 'home/customer_profile', to: 'customer#customer_profile', as: 'customer_profile'
  
  get '/customer/customer_profile/my_jobs/', to: 'job#my_jobs', as: 'my_jobs'
  get '/customer/customer_profile/my_jobs/edit/:customer_id', to: 'job#edit', as: 'edit'
  patch '/customer/customer_profile/my_jobs/:customer_id', to: 'job#update', as: 'update_job'
  put '/customer/customer_profile/my_jobs/:customer_id', to: 'job#update'

  get '/home/jobs', to: 'job#jobs', as: 'jobs'
  
  post '/home/jobs', to: 'job#create'
  get '/home/jobs/new', to: 'job#new', as: 'new_job'

  get 'home/jobs/:specialty_index', to: 'job#index', as: 'job_type'
  
  delete '/home/jobs/:id', to: 'job#delete', as: 'delete_job'
  
  get 'home/worker', to: 'worker#home', as: 'worker_home'
  get 'home/worker/worker_profile', to: 'worker#worker_profile', as: 'worker_profile'
  
  get 'home/worker_directory/:specialty_index', to: 'worker#index', as: 'worker_directory'
  get 'home/worker_directory/:specialty_index/:id', to: 'worker#show', as: 'worker'

  get '/search', to: 'worker#search'


end
