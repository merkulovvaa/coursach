class AmountOfVacationDaysService
  def self.call(doctor_id)
    vacation_days = UnavailableDate.where(doctor_id: doctor_id, leave_type: "vacation").sum { |date| (date.end_date - date.start_date).to_i + 1 }
    return 28 - vacation_days
  end
end
