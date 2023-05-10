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
class Doctor < ApplicationRecord
  belongs_to :gender
  belongs_to :spec
  belongs_to :department
  has_many :unavailable_dates
  has_many :appointments

  enum status: { active: 0, inactive: 1 }

  def update_rating
    rating = appointments.sum(&:rating) / appointments.count

    update(rating: rating)
  end
end
