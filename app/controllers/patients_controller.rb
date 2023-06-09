class PatientsController < ApplicationController
  # before_action :authenticate_patient!
  def index
    @patients = Patient.all
  end

  def show
    @patient = current_patient
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      OutpatientCard.create(patient_id: @patient.id)
      render :edit
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to patients_path
  end

  private

  def patient_params
    params.require(:patient).permit(:full_name, :address, :phone_number, :email, :birth_date, :outpatient_card_id, :gender_id, :avatar)
  end
end