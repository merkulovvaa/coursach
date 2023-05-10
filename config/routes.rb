Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :outpatient_cards
  resources :patient_analyses
  resources :analyses
  resources :patients
  resources :appointments
  resources :doctors
  resources :genders
  resources :departments
  resources :specs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
