# == Schema Information
#
# Table name: unavailable_dates
#
#  id         :integer          not null, primary key
#  end_date   :date
#  leave_type :integer          default(0)
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  doctor_id  :integer          not null
#
# Indexes
#
#  index_unavailable_dates_on_doctor_id  (doctor_id)
#
# Foreign Keys
#
#  doctor_id  (doctor_id => doctors.id)
#
class UnavailableDate < ApplicationRecord
  belongs_to :doctor
  enum leave_type: { sick_leave: 0, vacation: 1 }
end
