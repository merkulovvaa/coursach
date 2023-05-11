# == Schema Information
#
# Table name: patients
#
#  id                     :integer          not null, primary key
#  address                :string
#  birth_date             :date
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  full_name              :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  gender_id              :integer
#
# Indexes
#
#  index_patients_on_email                 (email) UNIQUE
#  index_patients_on_gender_id             (gender_id)
#  index_patients_on_reset_password_token  (reset_password_token) UNIQUE
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
