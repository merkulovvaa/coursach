json.extract! outpatient_card, :id, :patient_id, :appointment_id, :created_at, :updated_at
json.url outpatient_card_url(outpatient_card, format: :json)
