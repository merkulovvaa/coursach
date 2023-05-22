# == Schema Information
#
# Table name: appointments
#
#  id                 :integer          not null, primary key
#  app_time           :datetime
#  appointment_date   :date
#  rating             :float
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
  has_many :analyses, through: :patient_analysis
  has_one :patient, through: :outpatient_card

  enum status: { active: 0, finished: 1, canceled: -1 }

  delegate :full_name, to: :doctor, prefix: true, allow_nil: true
  delegate :spec_id, to: :doctor, prefix: true, allow_nil: true
  delegate :patient_id, to: :outpatient_card, prefix: true, allow_nil: true


  attribute :doctor_spec, :string

  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, allow_nil: true

  def self.cancel_all
    appointments = Appointment.where(status: 0).where('app_time <= ?', Time.zone.today.end_of_day)
    appointments.update_all(status: -1)
  end
end
