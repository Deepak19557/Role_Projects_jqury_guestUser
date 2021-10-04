Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: 'registrations' ,sessions: 'sessions'}
  resources :homes
  #resources :users
  resources :guestusers
  resources :appointments
  post 'page_1', to: 'homes#page_1'
  root  "appointments#index"
  get 'guest_user', to: 'users#guest_user'
  # get 'guest_user', to: 'appointments#guest_user'
end
