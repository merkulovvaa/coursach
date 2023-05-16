# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Gender.create!(name_gender: 'Female')
Gender.create!(name_gender: 'Male')

Category.create!(category_name: 'First category')
Category.create!(category_name: 'Second category')
Category.create!(category_name: 'Highest category')

Spec.create!(name_spec: "Dermatologist")
Spec.create!(name_spec: "Gynecologist")
Spec.create!(name_spec: "Nutritionist")
Spec.create!(name_spec: "Cardiologist")
Spec.create!(name_spec: "Neurologist")
Spec.create!(name_spec: "Orthopedist")
Spec.create!(name_spec: "Oncologist")
Spec.create!(name_spec: "ENT")
Spec.create!(name_spec: "Psychiatrist")
Spec.create!(name_spec: "Surgeon")
Spec.create!(name_spec: "Gastroenterologist")
Spec.create!(name_spec: "Endocrinologist")

Department.create!(name_depart: 'Surgical department')
Department.create!(name_depart: 'Gynecological department')
Department.create!(name_depart: 'Therapeutic department')
Department.create!(name_depart: 'Cardiology department')
Department.create!(name_depart: 'Psychosomatic department')
Department.create!(name_depart: 'Endocrinological department')
Department.create!(name_depart: 'Gastroenterological department')

30.times do
  Doctor.create!(
    full_name: Faker::Name.name,
    email: "doctor#{index+1}@mail.com",
    password: 'password1',
    password_confirmation: 'password1',
    gender: Gender.all.sample,
    spec: Spec.all.sample,
    category: Category.all.sample,
    department: Department.all.sample,
    start_working_date: Faker::Date.between(from: 30.years.ago, to: Date.today)
  )
end

5.times do
  patient = Patient.create!(
    full_name: Faker::Name.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    email: "patient#{index+1}@mail.com",
    password: 'password1',
    password_confirmation: 'password1',
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

Analysis.create!(name_analysis: 'Complete Blood Count (CBC)')
Analysis.create!(name_analysis: 'Blood Glucose Test')
Analysis.create!(name_analysis: 'Cholesterol')
Analysis.create!(name_analysis: 'Triglyceride levels')
Analysis.create!(name_analysis: 'Liver Function Test (LFT)')
Analysis.create!(name_analysis: 'Kidney Function Test (KFT)')
Analysis.create!(name_analysis: 'Thyroid Function Test (TFT)')
Analysis.create!(name_analysis: 'Stool Examination')
Analysis.create!(name_analysis: 'Electrocardiogram (ECG)')
Analysis.create!(name_analysis: 'Ultrasound')
Analysis.create!(name_analysis: 'Pap Smear (for women)')
Analysis.create!(name_analysis: 'Bone Density Scan')
Analysis.create!(name_analysis: 'Allergy Testing')
Analysis.create!(name_analysis: 'HIV Test')
Analysis.create!(name_analysis: 'Vitamin D Levels')
Analysis.create!(name_analysis: 'Tumor Marker Tests')

100.times do
  appointment_cur = Appointment.all.sample
  PatientAnalysis.create!(
    analysis: Analysis.all.sample,
    appointment: appointment_cur,
    analysis_date: Faker::Date.between(from: appointment_cur.appointment_date, to: Date.today)
  )
  end


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?