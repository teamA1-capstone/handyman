Rails.application.routes.draw do
  
  devise_for :workers
  devise_for :customers
  
  root to: redirect('/home')
  get 'home', to: 'customer#home', as: 'home'

  get 'home/worker', to: 'worker#home', as: 'worker_home'

  get 'home/customer_profile', to: 'customer#customer_profile', as: 'customer_profile'

end
