module Patients

  class DoctorsController < ApplicationController
    def index
      @doctors = Doctor.by_spec(params[:specialty])
    end

    def show
      @doctor = current_doctor
    end

    def new
      @doctor = Doctor.new
    end

    def create
      @doctor = Doctor.new(doctor_params)

      if @doctor.save
        redirect_to @doctor
      else
        render :new
      end
    end

    def edit
      @doctor = Doctor.find(params[:id])
    end

    def update
      @doctor = Doctor.find(params[:id])

      if @doctor.update(doctor_params)
        redirect_to @doctor
      else
        render :edit
      end
    end

    def destroy
      @doctor = Doctor.find(params[:id])
      @doctor.destroy

      redirect_to patients_doctors_path
    end

    private

    def doctor_params
      params.require(:doctor).permit(:full_name, :email, :gender_id, :spec_id, :department_id, :start_working_date)
    end
  end
end