# == Schema Information
#
# Table name: patient_analyses
#
#  id             :integer          not null, primary key
#  analysis_date  :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  analysis_id    :integer          not null
#  appointment_id :integer          not null
#
# Indexes
#
#  index_patient_analyses_on_analysis_id     (analysis_id)
#  index_patient_analyses_on_appointment_id  (appointment_id)
#
# Foreign Keys
#
#  analysis_id     (analysis_id => analyses.id)
#  appointment_id  (appointment_id => appointments.id)
#
class PatientAnalysis < ApplicationRecord
  belongs_to :analysis
  belongs_to :appointment
end
