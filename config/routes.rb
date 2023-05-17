Rails.application.routes.draw do
  devise_for :patients
  devise_for :doctors
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_scope :patient do
    authenticated :patient do
      root 'pages#patient', as: :patient_root
    end
  end

  devise_scope :doctor do
    authenticated :doctor do
      root 'pages#doctor', as: :doctor_root
      get '/appointments', to: 'pages#appointments', as: :doctor_appointments
    end
  end

  root "pages#home"

  namespace :patients do
    resources :appointments
    post '/appointments/appointment_date', to: 'appointments#appointment_date', as: 'appointment_date'
    resources :doctors
  end

  namespace :doctors do
    resources :appointments
  end

  resources :outpatient_cards
  resources :patient_analyses
  resources :analyses
  resources :appointments
  resources :genders
  resources :departments
  resources :specs
  resources :doctors
  resources :patients
  resources :unavailable_dates
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end
