class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # before_action :authorize_doctor!
  #
  # def authenticate_user!
  #   allow_list = [root_path, new_patient_session_path, new_doctor_session_path, new_patient_registration_path,
  #                 cancel_patient_registration_path, new_patient_password_path, new_doctor_password_path,
  #                 edit_patient_registration_path, new_admin_user_session_path, new_admin_user_password_path]
  #   redirect_to root_path unless allow_list.include?(request.path) || patient_signed_in? || doctor_signed_in? || admin_user_signed_in?
  # end
  #
  # def authorize_doctor!
  #   return unless doctor_signed_in?
  #   forbidden_list = [new_patient_session_path,
  #                     patient_session_path,
  #                     destroy_patient_session_path,
  #                     new_patient_password_path,
  #                     edit_patient_password_path,
  #                     patient_password_path,
  #                     cancel_patient_registration_path,
  #                     new_patient_registration_path,
  #                     edit_patient_registration_path,
  #                     patient_registration_path,
  #                     new_admin_user_session_path,
  #                     admin_user_session_path,
  #                     destroy_admin_user_session_path,
  #                     new_admin_user_password_path,
  #                     edit_admin_user_password_path,
  #                     admin_user_password_path,
  #                     batch_action_admin_admin_users_path,
  #                     admin_admin_users_path,
  #                     new_admin_admin_user_path,
  #                     edit_admin_admin_user_path(:id),
  #                     admin_admin_user_path(:id),
  #                     admin_dashboard_path,
  #                     batch_action_admin_doctors_path,
  #                     admin_doctors_path,
  #                     new_admin_doctor_path,
  #                     edit_admin_doctor_path(:id),
  #                     admin_doctor_path(:id),
  #                     batch_action_admin_patients_path,
  #                     admin_patients_path,
  #                     new_admin_patient_path,
  #                     edit_admin_patient_path(:id),
  #                     admin_patient_path(:id),
  #                     admin_comments_path,
  #                     admin_comment_path(:id),
  #                     new_outpatient_card_path,
  #                     edit_outpatient_card_path(:id),
  #                     outpatient_card_path(:id),
  #                     new_analysis_path,
  #                     edit_analysis_path(:id),
  #                     new_gender_path,
  #                     edit_gender_path(:id),
  #                     new_department_path,
  #                     edit_department_path(:id),
  #                     new_spec_path,
  #                     edit_spec_path(:id),
  #                     new_doctor_path,
  #                     new_patient_path,
  #                     edit_patient_path(:id),
  #                     edit_unavailable_date_path(:id),
  #                     turbo_recede_historical_location_path,
  #                     turbo_resume_historical_location_path,
  #                     turbo_refresh_historical_location_path,
  #                     rails_postmark_inbound_emails_path,
  #                     rails_relay_inbound_emails_path,
  #                     rails_sendgrid_inbound_emails_path,
  #                     rails_mandrill_inbound_health_check_path,
  #                     rails_mandrill_inbound_emails_path,
  #                     rails_mailgun_inbound_emails_path,
  #                     rails_conductor_inbound_emails_path,
  #                     new_rails_conductor_inbound_email_path,
  #                     edit_rails_conductor_inbound_email_path(:id),
  #                     rails_conductor_inbound_email_path(:id),
  #                     new_rails_conductor_inbound_email_source_path,
  #                     rails_conductor_inbound_email_sources_path,
  #                     rails_conductor_inbound_email_reroute_path(':inbound_email_id'),
  #                     rails_conductor_inbound_email_incinerate_path(':inbound_email_id'),
  #                     rails_service_blob_path('redirect', ':signed_id', '*filename'),
  #                     rails_service_blob_proxy_path(':signed_id', '*filename'),
  #                     rails_service_blob_path(':signed_id', '*filename'),
  #                     rails_blob_representation_path('redirect', ':signed_blob_id', ':variation_key', '*filename'),
  #                     rails_blob_representation_proxy_path(':signed_blob_id', ':variation_key', '*filename'),
  #                     rails_blob_representation_path(':signed_blob_id', ':variation_key', '*filename'),
  #                     rails_disk_service_path(':encoded_key', '*filename'),
  #                     update_rails_disk_service_path(':encoded_token'),
  #                     rails_direct_uploads_path
  #   ]
  #   redirect_to doctor_root_path if forbidden_list.include?(request.path)
  # end
end
