# == Schema Information
#
# Table name: declarations
#
#  id         :integer          not null, primary key
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  doctor_id  :integer          not null
#  patient_id :integer          not null
#
# Indexes
#
#  index_declarations_on_doctor_id   (doctor_id)
#  index_declarations_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  doctor_id   (doctor_id => doctors.id)
#  patient_id  (patient_id => patients.id)
#
require "test_helper"

class DeclarationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
