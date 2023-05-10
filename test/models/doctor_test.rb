# == Schema Information
#
# Table name: doctors
#
#  id                 :integer          not null, primary key
#  email              :string
#  full_name          :string
#  start_working_date :date
#  status             :integer          default("active")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  department_id      :integer          not null
#  gender_id          :integer          not null
#  spec_id            :integer          not null
#
# Indexes
#
#  index_doctors_on_department_id  (department_id)
#  index_doctors_on_gender_id      (gender_id)
#  index_doctors_on_spec_id        (spec_id)
#
# Foreign Keys
#
#  department_id  (department_id => departments.id)
#  gender_id      (gender_id => genders.id)
#  spec_id        (spec_id => specs.id)
#
require "test_helper"

class DoctorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
