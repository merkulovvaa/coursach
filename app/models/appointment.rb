# == Schema Information
#
# Table name: appointments
#
#  id                 :integer          not null, primary key
#  appointment_date   :date
#  report             :string
#  status             :integer          default("active")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  doctor_id          :integer          not null
#  outpatient_card_id :integer          not null
#
# Indexes
#
#  index_appointments_on_doctor_id           (doctor_id)
#  index_appointments_on_outpatient_card_id  (outpatient_card_id)
#
# Foreign Keys
#
#  doctor_id           (doctor_id => doctors.id)
#  outpatient_card_id  (outpatient_card_id => outpatient_cards.id)
#
class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :outpatient_card
  has_many :patient_analysis, dependent: :destroy

  enum status: { active: 0, finished: 1, canceled: -1 }

  delegate :full_name, to: :doctor, prefix: true, allow_nil: true
  delegate :spec_id, to: :doctor, prefix: true, allow_nil: true
  delegate :patient_id, to: :outpatient_card, prefix: true, allow_nil: true


  attribute :doctor_spec, :string
end
