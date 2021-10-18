Rails.application.routes.draw do
  
  as :customers do
    root to: 'worker#home', as: 'customer_root'
  end

  as :workers do
    root to: 'worker#home', as: 'worker_root'
  end

  devise_for :workers
  devise_for :customers
  
  root to: redirect('/home')
  
  get 'home', to: 'customer#home', as: 'home'

  get 'home/worker', to: 'worker#home', as: 'worker_home'

  get 'home/customer_profile', to: 'customer#customer_profile', as: 'customer_profile'

  get 'home/worker/worker_profile', to: 'worker#worker_profile', as: 'worker_profile'

  get 'home/worker_directory', to: 'worker#index', as: 'worker_directory'

end
