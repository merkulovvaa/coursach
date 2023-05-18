every :day, at: '23:59' do
  runner 'Appointment.cancel_all'
end
