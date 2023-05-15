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
      root 'doctors#show', as: :doctor_root
    end
  end

  root "pages#home"

  namespace :patients do
    resources :doctors
  end

  namespace :patients do
    resources :appointments
    post '/appointments/appointment_date', to: 'appointments#appointment_date', as: 'appointment_date'
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
end
