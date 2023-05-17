class Doctors::AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params.except(:analysis_ids))

    if @appointment.save
      redirect_to doctors_appointment_path(@appointment)
    else
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params.except(:analysis_ids))
      if params[:commit] == "Finish Appointment"
        @appointment.update(status: 1)
      end
      if params[:commit] == "Cancel Appointment"
        @appointment.update(status: -1)
      end
      if appointment_params[:analysis_ids].present?
        appointment_params[:analysis_ids].each do |analysis_id|
          PatientAnalysis.create(analysis_date: @appointment.appointment_date, analysis_id: analysis_id, appointment_id: @appointment.id)
        end
      end
      redirect_to doctors_appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    redirect_to doctors_appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :outpatient_card_id, :appointment_date, :report, analysis_ids: [])
  end
end