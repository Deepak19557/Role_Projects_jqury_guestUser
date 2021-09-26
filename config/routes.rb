Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: 'registrations' ,sessions: 'sessions'}
  resources :homes
  resources :users
  resources :appointments
  post 'page_1', to: 'homes#page_1'
  root  "appointments#index"
end
