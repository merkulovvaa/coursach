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
  validate :end_date_is_after_start_date
  validate :no_overlapping_unavailable_dates
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :doctor
  enum leave_type: { sick_leave: 0, vacation: 1 }

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "должна быть позже даты начала")
    end
  end

  def no_overlapping_unavailable_dates
    overlapping_dates = doctor.unavailable_dates.where("(? BETWEEN start_date AND end_date)
      OR (? BETWEEN start_date AND end_date)
      OR (start_date BETWEEN ? AND ?)
      OR (end_date BETWEEN ? AND ?)",
      start_date, end_date, start_date, end_date, start_date, end_date)

    if overlapping_dates.exists?
      errors.add(:base, "Период недоступных дат пересекается с другой записью")
    end
  end
end
