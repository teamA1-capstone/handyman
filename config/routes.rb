Rails.application.routes.draw do
  
  devise_for :workers
  root to: redirect('/home')
  
  get 'home', to: 'customer#home', as: 'home'

  get 'home/worker', to: 'customer#workerhome', as: "workerhome"

end
