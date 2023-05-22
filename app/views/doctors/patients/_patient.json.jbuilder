json.extract! patient, :id, :full_name, :gender_id, :birth_date, :address, :phone_number, :email, :outpatient_card_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
