# == Schema Information
#
# Table name: patients
#
#  id           :integer          not null, primary key
#  address      :string
#  birth_date   :date
#  email        :string
#  full_name    :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  gender_id    :integer          not null
#
# Indexes
#
#  index_patients_on_gender_id  (gender_id)
#
# Foreign Keys
#
#  gender_id  (gender_id => genders.id)
#
require "test_helper"

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
