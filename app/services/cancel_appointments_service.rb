class CancelAppointmentsService
  def self.call(doctor, start_date, end_date)
    dates = (start_date..end_date).step(1).to_a
    dates.each do |date|
      appointments = doctor.appointments.where(appointment_date: date).where(status: 0)
      appointments.each do |appointment|
        appointment.update(status: -1)
      end
    end
  end
end