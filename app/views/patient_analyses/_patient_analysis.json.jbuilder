json.extract! patient_analysis, :id, :analysis_id, :analysis_date, :created_at, :updated_at
json.url patient_analysis_url(patient_analysis, format: :json)
