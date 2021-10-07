Rails.application.routes.draw do
  
  root to: redirect('/home')
  
  get 'home', to: 'customer#home', as: 'home'


end
