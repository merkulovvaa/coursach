class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_user!
    redirect_to root_path unless request.path == new_patient_session_path || request.path == new_doctor_session_path ||
      request.path == root_path || request.path == new_patient_registration_path ||
      request.path == edit_patient_registration_path || request.path == new_admin_user_session_path ||
      patient_signed_in? || doctor_signed_in?
  end
end
