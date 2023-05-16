class AvailableTimesService
  def self.call(doctor, appointment_date)
    times = []
    start_time = Time.parse("08:00")
    end_time = Time.parse("13:00")

    while start_time < end_time
      app_time = DateTime.new(appointment_date.year, appointment_date.month, appointment_date.day, start_time.hour, start_time.min, start_time.sec, start_time.zone)
      unless doctor.appointments.exists?(appointment_date: appointment_date, app_time: app_time, status: [0, 1]) or app_time < DateTime.now
        times << app_time
      end
      start_time += 30.minutes
    end

    times
  end
end
