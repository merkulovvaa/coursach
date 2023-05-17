class Patients::AppointmentsController < ApplicationController
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
      @available_dates = AvailableDatesService.new(@selected_doctor, Date.today, 14.days.from_now).call
    end

    def appointment_date
      @appointment = Appointment.new
      @appointment.outpatient_card_id = current_patient.id
      @appointment.appointment_date = Date.parse(appointment_params[:appointment_date])
      @selected_doctor = Doctor.find(appointment_params[:doctor_id]) if appointment_params[:doctor_id]

      @available_times = AvailableTimesService.call(@selected_doctor, @appointment.appointment_date)
      render 'final_choose'
    end

    def create
      @appointment = Appointment.new(appointment_params)
      appointment_date = Date.parse(appointment_params[:appointment_date])
      appointment_time = Time.zone.parse(appointment_params[:app_time])
      @appointment.app_time = DateTime.new(appointment_date.year, appointment_date.month, appointment_date.day, appointment_time.hour, appointment_time.min, appointment_time.sec, appointment_time.zone)

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
        redirect_to patients_appointment_path(@appointment)
      else
        render :edit
      end
    end

    def destroy
      @appointment = Appointment.find(params[:id])
      @appointment.canceled!

      redirect_to patients_appointments_path
    end

    def update_rating
      @appointment = Appointment.find(params[:id])
      @appointment.doctor.update_rating if @appointment.finished?
    end

    private

    def appointment_params
      params.require(:appointment).permit(:doctor_id, :outpatient_card_id, :appointment_date, :report, :status, :app_time, :rating)
    end

  end
