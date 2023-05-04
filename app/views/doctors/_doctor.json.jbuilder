json.extract! doctor, :id, :full_name, :gender_id, :spec_id, :department_id, :start_working_date, :email, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
