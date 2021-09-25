Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: 'registrations' ,sessions: 'sessions'}
  resources :homes
  resources :users
  #root "homes#page_1"
  post 'page_1', to: 'homes#page_1'
  root  "appointments#index"
  resources :appointments
  #devise_for :users ,except: :show


end
