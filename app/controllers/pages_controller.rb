class PagesController < ApplicationController

  before_action :authenticate_doctor!, only: [:appointments]

  def after_sign_in_path_for(resource)
    if resource.is_a?(Doctor)
      doctor_root_path
    elsif resource.is_a?(Patient)
      patient_root_path
    else
      super
    end
  end

  def appointments
    @appointments = current_doctor.appointments
    render "pages/doctors/appointments"
  end
end
