# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Gender.create!(name_gender: 'Female')
Gender.create!(name_gender: 'Male')

10.times do
  Spec.create!(name_spec: Faker::Job.field)
end

10.times do
  Department.create!(name_depart: Faker::Company.industry)
end

20.times do
  Doctor.create!(
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    gender: Gender.all.sample,
    spec: Spec.all.sample,
    department: Department.all.sample,
    start_working_date: Faker::Date.between(from: 30.years.ago, to: Date.today)
  )
end

100.times do
  patient = Patient.create!(
    full_name: Faker::Name.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    birth_date: Faker::Date.between(from: 90.years.ago, to: 18.years.ago),
    gender: Gender.all.sample
  )
  OutpatientCard.create!(patient: patient)
end

50.times do
  Appointment.create!(
    doctor: Doctor.all.sample,
    outpatient_card: OutpatientCard.all.sample,
    appointment_date: Faker::Date.between(from: 10.month.ago, to: 1.month.from_now),
    report: Faker::Lorem.paragraph
  )
end

Analysis.create!(name_analysis: 'Blood Test')
Analysis.create!(name_analysis: 'Urine Test')
Analysis.create!(name_analysis: 'X-Ray')

100.times do
  appointment_cur = Appointment.all.sample
  PatientAnalysis.create!(
    analysis: Analysis.all.sample,
    appointment: appointment_cur,
    analysis_date: Faker::Date.between(from: appointment_cur.appointment_date, to: Date.today)
  )
  end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?