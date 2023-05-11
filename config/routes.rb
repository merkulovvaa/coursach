Rails.application.routes.draw do

  devise_for :patients
  devise_for :doctors
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_scope :patient do
    authenticated :patient do
      root 'patients#show', as: :patient_root
    end
  end

  devise_scope :doctor do
    authenticated :doctor do
      root 'pages#doctor', as: :doctor_root
      get '/appointments', to: 'pages#appointments', as: :doctor_appointments
    end
  end

  root "pages#home"

  resources :outpatient_cards
  resources :patient_analyses
  resources :analyses
  resources :appointments
  resources :genders
  resources :departments
  resources :specs
  resources :doctors
  resources :patients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end
