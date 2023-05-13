module Patients

  class AppointmentsController < ApplicationController
    def index
    @appointments = current_patient.outpatient_card.appointments
    end

    def show
      @appointment = Appointment.find(params[:id])
    end

    def new
      @appointment = Appointment.new
      @appointment.outpatient_card_id = current_patient.id
      @selected_doctor = Doctor.find(params[:doctor_id]) if params[:doctor_id]
    end

    def create
      @appointment = Appointment.new(appointment_params)

      if @appointment.save
        redirect_to patients_appointment_path(@appointment)
      else
        render :new
      end
    end

    def edit
      @appointment = Appointment.find(params[:id])
    end

    def update
      @appointment = Appointment.find(params[:id])

      if @appointment.update(appointment_params)
        redirect_to @appointment
      else
        render :edit
      end
    end

    def destroy
      @appointment = Appointment.find(params[:id])


      @appointment.canceled!

      redirect_to patients_appointments_path
    end

    private

    def appointment_params
      params.require(:appointment).permit(:doctor_id, :outpatient_card_id, :appointment_date, :report, :status)
    end
  end
end
