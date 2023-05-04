# == Schema Information
#
# Table name: outpatient_cards
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  patient_id :integer          not null
#
# Indexes
#
#  index_outpatient_cards_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  patient_id  (patient_id => patients.id)
#
require "test_helper"

class OutpatientCardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
