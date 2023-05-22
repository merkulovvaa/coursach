class Doctors::PatientsController < ApplicationController
    before_action :authenticate_doctor!

    def index
      @patients = Patient.all
    end

    def show
      @patient = Patient.find(params[:id])
    end

    private

    def patient_params
      params.require(:patient).permit(:full_name, :address, :phone_number, :email, :birth_date, :outpatient_card_id, :gender_id, :avatar)
    end
end
